# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_rp_global_optspecs
	string join \n g/group= h/help V/version
end

function __fish_rp_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_rp_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_rp_using_subcommand
	set -l cmd (__fish_rp_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c rp -n "__fish_rp_needs_command" -s g -l group -d 'Group name' -r
complete -c rp -n "__fish_rp_needs_command" -s h -l help -d 'Print help'
complete -c rp -n "__fish_rp_needs_command" -s V -l version -d 'Print version'
complete -c rp -n "__fish_rp_needs_command" -f -a "list" -d 'List configured items'
complete -c rp -n "__fish_rp_needs_command" -f -a "reset" -d 'Reset configured items'
complete -c rp -n "__fish_rp_needs_command" -f -a "completion" -d 'Generate shell completion'
complete -c rp -n "__fish_rp_needs_command" -f -a "gen-config" -d 'Generate sample config'
complete -c rp -n "__fish_rp_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rp -n "__fish_rp_using_subcommand list" -s h -l help -d 'Print help'
complete -c rp -n "__fish_rp_using_subcommand reset" -s h -l help -d 'Print help'
complete -c rp -n "__fish_rp_using_subcommand completion" -s h -l help -d 'Print help'
complete -c rp -n "__fish_rp_using_subcommand gen-config" -s h -l help -d 'Print help'
complete -c rp -n "__fish_rp_using_subcommand help; and not __fish_seen_subcommand_from list reset completion gen-config help" -f -a "list" -d 'List configured items'
complete -c rp -n "__fish_rp_using_subcommand help; and not __fish_seen_subcommand_from list reset completion gen-config help" -f -a "reset" -d 'Reset configured items'
complete -c rp -n "__fish_rp_using_subcommand help; and not __fish_seen_subcommand_from list reset completion gen-config help" -f -a "completion" -d 'Generate shell completion'
complete -c rp -n "__fish_rp_using_subcommand help; and not __fish_seen_subcommand_from list reset completion gen-config help" -f -a "gen-config" -d 'Generate sample config'
complete -c rp -n "__fish_rp_using_subcommand help; and not __fish_seen_subcommand_from list reset completion gen-config help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
