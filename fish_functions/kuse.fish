# Defined in - @ line 0
function kuse --description alias\ kuse=kubectl\ get\ nodes\ --no-headers\ \|\ awk\ \'\{print\ \$1\}\'\ \|\ xargs\ -I\ \\\{\\\}\ sh\ -c\ \'echo\ \{\}\ \;\ kubectl\ describe\ node\ \{\}\ \|\ grep\ Allocated\ -A\ 5\ \|\ grep\ -ve\ Event\ -ve\ Allocated\ -ve\ percent\ -ve\ --\ \;\ echo\ \'
	kubectl get nodes --no-headers | awk '{print $1}' | xargs -I \{\} sh -c 'echo {} ; kubectl describe node {} | grep Allocated -A 5 | grep -ve Event -ve Allocated -ve percent -ve -- ; echo ' $argv;
end
