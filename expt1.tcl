#create a simulator object
set ns [new Simulator]

# open the nam trace file
set nf [open out.nam w]
$ns namtrace-all $nf
# Define a finish procedure
proc finish {} {
        global ns nf
        $ns flush-trace
        close $nf
        exec nam out.nam &
        exit 0
}

# Create two nodes
set n0 [$ns node]
set n1 [$ns node]

# Create a duplex link between the nodes
$ns duplex-link $n0 $n1 1Mb 10ms DropTail

#Call the finish procedure after 5 seconds of simulation time 
$ns at 5.0 "finish"

#Run the simulation
$ns run
