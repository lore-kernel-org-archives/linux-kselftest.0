From: petrm at mellanox.com (Petr Machata)
Date: Fri, 25 May 2018 12:05:38 +0300
Subject: [PATCH net-next] selftests: net: Test headroom handling of
 ip6_gre devices
In-Reply-To: <CALDO+Sbf3DEKyXnQNjyJNF-E+rroZ7XcKCYjiPOSDnzfkjwQiQ@mail.gmail.com>
 (William Tu's message of "Thu, 24 May 2018 09:19:53 -0700")
References: <a78543459df02997bc298c09e9aa56167b22d5a4.1527093523.git.petrm@mellanox.com>
 <CALDO+Sbf3DEKyXnQNjyJNF-E+rroZ7XcKCYjiPOSDnzfkjwQiQ@mail.gmail.com>
Message-ID: <wihfu2ggl5p.fsf@dev-r-vrt-156.mtr.labs.mlnx>

William Tu <u9012063 at gmail.com> writes:

>> +cleanup()
>> +{
>> +       ip link del dev swp1
>> +       ip link del dev swp3
>> +       ip link del dev vh3
> I think we also need to do:
> ip link del dev gt6

gt6 is removed in test_headroom, but for early-break sort of scenarios I
guess we do want to have it in cleanup() as well. With 2>/dev/null,
because most of the time it will have been cleaned up already. I'll send
a v2 like that.

>> +test_headroom()
>> +{
>> +       ip link add name gt6 "$@"
>> +       ip link set dev gt6 up
>> +
>> +       sleep 1
>> +
>> +       tc filter add dev swp1 ingress pref 1000 matchall skip_hw \
>> +               action mirred egress mirror dev gt6
>> +       ping -I h1 192.0.2.2 -c 1 -w 2 &> /dev/null
>
> I increase ping count from 1 to 1000
> and after a while the program hangs when I try to ctrl+c
> + cleanup
> + ip link del dev swp1
> dmesg shows:
> ....
> [ 1256.002453] unregister_netdevice: waiting for swp1 to become free.
> Usage count = 9
> [ 1266.082571] unregister_netdevice: waiting for swp1 to become free.
> Usage count = 9
> [ 1276.163011] unregister_netdevice: waiting for swp1 to become free.
> Usage count = 9

Interesting. Looks like another bug, the headroom issue would panic
after the first packet (and only after the first packet--increasing ping
count doesn't make it more likely to reproduce, rerunning the whole
script does).

Thanks,
Petr
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
