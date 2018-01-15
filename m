From: dsahern at gmail.com (David Ahern)
Date: Mon, 15 Jan 2018 16:48:25 -0700
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 00/12] selftests:
 forwarding: Add VRF-based tests
In-Reply-To: <20180115231735.GI2103@nanopsycho>
References: <20180115191853.26129-1-idosch@mellanox.com>
 <df929bcd-f15e-1897-fc54-c9aba9b65667@gmail.com>
 <20180115231735.GI2103@nanopsycho>
Message-ID: <bc5439a0-5761-47c8-7d3a-d05bb83b4e87@gmail.com>

On 1/15/18 4:17 PM, Jiri Pirko wrote:
>> A couple of feature requests:
>> 1. an option to pause on any error to allow inspection of the setup
> 
> Good idea. Should be easy to add.

Here is a snippet from my vrf test script:

PAUSE_ON_FAIL=no
-p option sets PAUSE_ON_FAIL=yes

log_test()
{
        local rc=$1
        local expected=$2
        local msg="$3"

        if [ ${rc} -eq ${expected} ]; then
                nsuccess=$((nsuccess+1))
                printf "\n    TEST: %-80s  [ OK ]\n" "${msg}"
        else
                nfail=$((nfail+1))
                printf "\n    TEST: %-80s  [FAIL]\n" "${msg}"
                if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
                        echo
                        echo "hit enter to continue, 'q' to quit"
                        read a
                        [ "$a" = "q" ] && exit 1
                fi
        fi
}


'rc' is the return code from the command run

'expected' is the expected return code. This allows negative testing
where rc can be non-0 and the test passes

'msg' is the name of the test.

The above maps close to print_result in lib.sh

(nsuccess and nfail track total number of tests run that pass/fail. I
print a summary when the test set is done.)

> 
> 
>>
>> 2. an option to configure the system and leave it in that state (ie,
>> don't trap exit and run cleanup). By extension, an option is needed to
>> do cleanup only.
> 
> Checkout the last patch. It has "noprepare" and "nocleanup" options.
> So I guess you imagine something like that, but generic?
> 

Sure that is one way.


Something else I have found useful is to not redirect stdout/stderr from
the commands and to have tags that can be grep'ed to provide a summary.
I run my VRF test script as:

$ run-test.sh 2>&1 | tee vrf-results.txt | grep TEST

The terminal gets a nice summary:

TEST SECTION: IPv4 ping
    TEST: ping out - VRF device, peer IP                     [ OK ]
    TEST: ping out - enslaved device, peer IP                [ OK ]
    TEST: ping in - My IP                                    [ OK ]
    TEST: ping in - VRF IP                                   [FAIL]
    TEST: ping local - VRF device, My IP                     [ OK ]
    TEST: ping local - VRF device, VRF IP                    [ OK ]
    TEST: ping local - VRF device, loopback                  [ OK ]
    TEST: ping local - enslaved device, My IP                [ OK ]
    TEST: ping local - enslaved device, VRF IP               [ OK ]
    TEST: ping out - VRF device, VRF source, peer IP         [ OK ]
    TEST: ping out - enslaved device, VRF source, peer IP    [ OK ]

And when I find a test failing I can go look at the full output:

$ vi vrf-results.txt

Test setup
        VRF name:         lisa
        Enslaved device   veth1

        Device addresses: 172.16.99.1  2001:db8:99::1
        VRF local IP:     1.1.1.1 1111:1::1

        Peer device:      veth2
        Peer addresses:   172.16.99.254   2001:db8:99::64

########################################
Configuring network namespace

Resetting config ...


######################################################################
TEST SECTION: IPv4 ping
######################################################################

####################
COMMAND: ping -c1 -w1 -I lisa 172.16.99.254

ping: Warning: source address might be selected on device other than lisa.
PING 172.16.99.254 (172.16.99.254) from 172.16.99.1 lisa: 56(84) bytes
of data.
64 bytes from 172.16.99.254: icmp_seq=1 ttl=64 time=0.084 ms

--- 172.16.99.254 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.084/0.084/0.084/0.000 ms

    TEST: ping out - VRF device, peer IP                      [ OK ]
...
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
