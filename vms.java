//usr/bin/env jbang "$0" "$@" ; exit $?
//DEPS info.picocli:picocli:4.2.0
//DEPS org.ovirt.engine.api:sdk:4.0.3
//DEPS org.slf4j:slf4j-simple:1.6.1

import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import static org.ovirt.engine.sdk4.ConnectionBuilder.connection;

import java.util.concurrent.Callable;

@Command(name = "vms", mixinStandardHelpOptions = true, version = "vms 0.1", description = "vms made with jbang")
class vms implements Callable<Integer> {

    @Option(names = {"-u", "--username"}, description = "username", defaultValue = "admin@internal")
    private String username;

    @Option(names = {"-p", "--password"}, required = true, description = "password", interactive = true)
    private String password;

    @Option(names = {"-l", "--url"}, description = "url", defaultValue = "https://engine-fqdn/ovirt-engine/api")
    private String url;

    public static final String FORMAT = "%-50s %-50s %-10s %n";

    public static void main(String... args) {
        int exitCode = new CommandLine(new vms()).execute(args);
        System.exit(exitCode);
    }

    @Override
    public Integer call() throws Exception {
        var connection = connection()
                .url(url)
                .user(username)
                .password(password)
                .insecure(true)
                .build();

        var vms = connection.systemService().vmsService().list().send();

        System.out.printf(FORMAT, "NAME", "ID", "STATUS");
        vms.vms().stream().forEach(vm -> System.out.printf(FORMAT, vm.name(), vm.id(), vm.status()));

        connection.close();
        return 0;
    }
}
