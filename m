From: anders.roxell@linaro.org (Anders Roxell)
Date: Tue, 3 Jul 2018 12:51:38 +0200
Subject: [PATCH] selftests: bpf: config: add config fragments
In-Reply-To: <CALDO+Sap3GTW3Ud4u-950ZicXpqfCh3kV5x8FVFpPmH+snOsGg@mail.gmail.com>
References: <20180612110510.11731-1-anders.roxell@linaro.org>
 <d6851756-ae3b-09ec-f487-1eeece6bd4c6@iogearbox.net>
 <CALDO+SY3qNYAOSiYC3645C7YY9LSx7ggg0GjY76m4TbBfF_t3A@mail.gmail.com>
 <CADYN=9+3V4fpqbjh-X4VUVWd_X38XSYhEbZoRBffcx=-nMtF8g@mail.gmail.com>
 <CALDO+SZXvnUU7VKd_UwnBCU0NiTHjqei4xEUCdcktkKCD3MnEg@mail.gmail.com>
 <CADYN=9KegM2wNCX7=BDct16bzzmr-02aG1c3MLDEEon1yGXnzQ@mail.gmail.com>
 <CALDO+SY2eE6DHtVmfnUpMjTjHe3shfzae48nk_OehfUyuKNYsg@mail.gmail.com>
 <CADYN=9JAOim7CvoZzWnbHNEF+4yG3Lzvry1rZLqGp+7hQxPdkw@mail.gmail.com>
 <CALDO+Sap3GTW3Ud4u-950ZicXpqfCh3kV5x8FVFpPmH+snOsGg@mail.gmail.com>
Message-ID:
 <CADYN=9LxoRfa6z2PQqs7fdLkDtSPvebrbO8T5gr3ZAjhEG5L_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180703105138.wOYjXG3vi5yDGLXLTn5UFtLl6nxohit1kV5ewKUkNwI@z>

On Tue, 26 Jun 2018@23:27, William Tu <u9012063@gmail.com> wrote:
>
> >> >
> >> > --- ::11 ping statistics ---
> >> > 5 packets transmitted, 3 packets received, 40% packet loss
> >> > round-trip min/avg/max = 0.139/1.857/5.293 ms
> >> > + ip netns exec at_ns0 ping -c 3 -w 10 -q 10.1.1.200
> >> > PING 10.1.1.200 (10.1.1.200): 56 data bytes
> >> >
> >> > --- 10.1.1.200 ping statistics ---
> >> > 3 packets transmitted, 3 packets received, 0% packet loss
> >> > round-trip min/avg/max = 0.214/0.256/0.305 ms
> >> > + ping -c 3 -w 10 -q 10.1.1.100
> >> > PING 10.1.1.100 (10.1.1.100): 56 data bytes
> >> >
> >> > --- 10.1.1.100 ping statistics ---
> >> > 3 packets transmitted, 3 packets received, 0% packet loss
> >> > round-trip min/avg/max = 0.210/0.211/0.213 ms
> >> > + check_err 0
> >> > + '[' 0 -eq 0 ']'
> >> > + ret=0
>
> So looks like the ipv4 over ipv6 gre passes.
>
> >> > + ip netns exec at_ns0 ping6 -c 3 -w 10 -q fc80::200
> >> > PING fc80::200 (fc80::200): 56 data bytes
> >> >
> >> > --- fc80::200 ping statistics ---
> >> > 10 packets transmitted, 0 packets received, 100% packet loss
> `
> but the ipv6 over ipv6 gre fails.
> Do you have any firewall rules that block this traffic?
> or if possible, the packet might get dropped at function ip6gre_xmit_ipv6
> can you print the return value of this function?
>
>
> >> > + check_err 1
> >> > + '[' 0 -eq 0 ']'
> >> > + ret=1
> >> > + ip -s link show ip6gretap11
> >> > 19: ip6gretap11 at NONE: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1434 qdisc
> >> > pfifo_fast state UNKNOWN mode DEFAULT group default qlen 1000
> >> >     link/ether de:d2:0c:53:80:8c brd ff:ff:ff:ff:ff:ff
> >> >     RX: bytes  packets  errors  dropped overrun mcast
> >> >     2096       25       0       0       0       0
> >> >     TX: bytes  packets  errors  dropped carrier collsns
> >> >     5324       36       5       5       0       0
> >>
> >> So there are 5 errors at TX.
> >
> > and today when I tried it on next-20180620 I saw 8 errors at TX.
> >
> >> I couldn't reproduce in my local machine using 4.17-rc6.
> >> How do I checkin the "next-20180613" source code?
> >
> > You can find the source code here [1], and I would look in the latest tag that I
> > said that I was able to reproduce it on above.
> >
> > Cheers,
> > Anders
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/
>
> Hi Anders,

Hi William,

>
> I'm still not able to reproduce the issue on next-20180620.

I'm not able to reproduce it either, and I tried on todays tag as well
next-20180703.

The only test that is failing in bpf/test_tunnel.sh:

FAIL: xfrm tunnel

Cheers,
Anders

> Below is my test.
>
> Testing IP6GRETAP tunnel...
> PING ::11(::11) 56 data bytes
>
> --- ::11 ping statistics ---
> 5 packets transmitted, 3 received, 40% packet loss, time 4048ms
> rtt min/avg/max/mdev = 0.040/32.118/96.235/45.337 ms
> PING 10.1.1.200 (10.1.1.200) 56(84) bytes of data.
>
> --- 10.1.1.200 ping statistics ---
> 3 packets transmitted, 3 received, 0% packet loss, time 2026ms
> rtt min/avg/max/mdev = 0.074/0.099/0.117/0.018 ms
> PING 10.1.1.100 (10.1.1.100) 56(84) bytes of data.
>
> --- 10.1.1.100 ping statistics ---
> 3 packets transmitted, 3 received, 0% packet loss, time 2054ms
> rtt min/avg/max/mdev = 0.069/0.113/0.187/0.052 ms
> PING fc80::200(fc80::200) 56 data bytes
>
> --- fc80::200 ping statistics ---
> 3 packets transmitted, 3 received, 0% packet loss, time 2054ms
> rtt min/avg/max/mdev = 0.069/0.104/0.142/0.031 ms
> PASS: ip6gretap
> root at osboxes:~/linux-next/tools/testing/selftests/bpf#
> root at osboxes:~/linux-next/tools/testing/selftests/bpf# uname -a
> Linux osboxes 4.18.0-rc1-next-20180620 #1 SMP Tue Jun 26 12:26:00 PDT
> 2018 x86_64 x86_64 x86_64 GNU/Linux
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
