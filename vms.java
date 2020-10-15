//usr/bin/env jbang "$0" "$@" ; exit $?
//DEPS info.picocli:picocli:4.2.0
//DEPS info.picocli:picocli-codegen:4.2.0
//DEPS org.ovirt.engine.api:sdk:4.4.0
//DEPS org.slf4j:slf4j-simple:1.6.1
//

import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import static org.ovirt.engine.sdk4.ConnectionBuilder.connection;

import java.util.concurrent.Callable;

import org.ovirt.engine.sdk4.Connection;
import org.ovirt.engine.sdk4.ConnectionBuilder;
import org.ovirt.engine.sdk4.internal.ConnectionBuilder42;
import org.ovirt.engine.sdk4.internal.ConnectionBuilder45;

@Command(name = "ovirt", subcommands = {Get.class}, mixinStandardHelpOptions = true, version = "vms 0.1", description = "vms made with jbang")
class vms implements Callable<Integer> {

    @Option(names = {"-u", "--username"}, description = "username", defaultValue = "admin@internal")
    private String username;

    @Option(names = {"-p", "--password"}, required = true, description = "password", interactive = true)
    private String password;

    @Option(names = {"-l", "--url"}, description = "url", defaultValue = "https://engine-fqdn/ovirt-engine/api")
    private String url;

    public static final String FORMAT = "%-50s %-39s %-10s %n";

    public static Connection connection;

    public static void main(String... args) {
        int exitCode = new CommandLine(new vms()).execute(args);
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.exit(exitCode);
    }

    @Override
    public Integer call() {
        System.out.printf("Start call of top level call\n");
        connection = new ConnectionBuilder42()
                .url(url)
                .user(username)
                .password(password)
                .insecure(true)
                .build();
        return 0;
    }
}

@Command(name = "get", subcommands = {VM.class}, mixinStandardHelpOptions = true, version = "vms 0.1", description = "vms made with jbang")
class Get implements Callable<Integer> {
    @Override
    public Integer call() throws Exception {
        System.out.printf("Start call of 2nd level call\n");
        return 0;
    }
}

@Command(name = "vms", mixinStandardHelpOptions = true, version = "vms 0.1", description = "vms made with jbang")
class VM implements Callable<Integer> {
    @Override
    public Integer call() throws Exception {
        System.out.printf(vms.FORMAT, "NAME", "ID", "STATUS");
        vms.connection.systemService().vmsService().list().send().vms()
                .stream()
                .forEach(vm -> System.out.printf(vms.FORMAT, vm.name(), vm.id(), vm.status()));

        return 0;
    }
}
