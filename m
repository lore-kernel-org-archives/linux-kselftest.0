From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Tue, 4 Jun 2019 22:47:23 +0530
Subject: bpf: test_xdp_vlan.sh: Kernel panic: Unable to handle kernel paging
 request at virtual address 000080096d61a000
Message-ID:
 <CA+G9fYtwG+-G+jGuV7xx2mkicMVA4z7LvO-xXiUe9VYqCbOG3A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190604171723.Fa2DAhavO5dbccQGRMBuxvfWiQrzk35I3LZl76sM_kk@z>

Kernel panic while running bpf: test_xdp_vlan.sh test case on
arm64 Juno hardware Linux version 5.2.0-rc3-next-20190604

bpf: test_xdp_vlan.sh

# --- 100.64.41.2 ping statistics ---
100.64.41.2: ping_statistics #
# 3 packets transmitted, 3 received, 0% packet loss, time 2049ms
packets: transmitted,_3 #
# rtt min/avg/max/mdev = 0.172/0.193/0.205/0.022 ms
min/avg/max/mdev: =_0.172/0.193/0.205/0.022 #
# PING 100.64.41.1 (100.64.41.1) 56(84) bytes of data.
100.64.41.1: (100.64.41.1)_56(84) #
# 64 bytes from 100.64.41.1 icmp_seq=1 ttl=64 time=0.146 ms
bytes: from_100.64.41.1 #
# 64 bytes from 100.64.41.1 icmp_seq=2 ttl=64 time=0.182 ms
bytes: from_100.64.41.1 #
[  492.263541] ip6_tunnel: gre6_dev xmit: Local address not yet configured!
[  788.768658] ip6_tunnel: gre6_dev xmit: Local address not yet configured!
[  940.373938] Unable to handle kernel paging request at virtual
address 000080096d61a000
[  940.381873] Mem abort info:
[  940.384717]   ESR = 0x96000004
[  940.387797]   Exception class = DABT (current EL), IL = 32 bits
[  940.393715]   SET = 0, FnV = 0
[  940.396788]   EA = 0, S1PTW = 0
[  940.399949] Data abort info:
[  940.402805]   ISV = 0, ISS = 0x00000004
[  940.406647]   CM = 0, WnR = 0
[  940.409639] user pgtable: 4k pages, 48-bit VAs, pgdp=000000093bee0000
[  940.416065] [000080096d61a000] pgd=0000000000000000
[  940.421079] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[  940.426598] Modules linked in: sit act_gact cls_flower cls_bpf
sch_ingress xt_tcpudp iptable_filter ip_tables x_tables tun algif_hash
af_alg tda998x drm_kms_helper drm crct10dif_ce
drm_panel_orientation_quirks fuse [last unloaded: test_bpf]
[  940.447715] CPU: 2 PID: 8748 Comm: ping Not tainted
5.2.0-rc3-next-20190604 #1
[  940.454865] Hardware name: ARM Juno development board (r2) (DT)
[  940.460727] pstate: 80000005 (Nzcv daif -PAN -UAO)
[  940.465480] pc : ip6_pol_route+0x1f4/0x738
[  940.469537] lr : ip6_pol_route+0x1d8/0x738
[  940.473590] sp : ffff000013fb3010
[  940.476870] x29: ffff000013fb3010 x28: ffff000011be3000
[  940.482132] x27: ffff80096f228a00 x26: ffff80096f364000
[  940.487393] x25: ffff000010da3500 x24: 000000000000004e
[  940.492654] x23: ffff00001198e000 x22: ffff000013fb3240
[  940.497915] x21: ffff00001195f000 x20: ffff80096bf95a00
[  940.503175] x19: ffff000013fb3268 x18: 0000000000000000
[  940.508435] x17: 0000000000000001 x16: 0000000000000000
[  940.513696] x15: 0000000000000000 x14: 1312111000000000
[  940.518956] x13: 0002ccaf00000000 x12: 5cf61adb01002c22
[  940.524216] x11: 0000000000000002 x10: 0000000000000003
[  940.529477] x9 : 0000000000000000 x8 : ffff00001195f848
[  940.534738] x7 : ffff000013fb2ffb x6 : 0000000000000000
[  940.539998] x5 : ffff80096f364000 x4 : 0000000000000001
[  940.545258] x3 : 0000000000000004 x2 : 000080096d61a000
[  940.550519] x1 : ffff80092e761700 x0 : 0000000000000000
[  940.555780] Call trace:
[  940.558202]  ip6_pol_route+0x1f4/0x738
[  940.561914]  ip6_pol_route_input+0x4c/0x60
[  940.565971]  fib6_rule_lookup+0xc8/0x170
[  940.569855]  ip6_route_input_lookup+0x70/0x88
[  940.574169]  ip6_route_input+0xe4/0x238
[  940.577969]  ip6_rcv_finish_core.isra.0+0x48/0x168
[  940.582713]  ip6_rcv_finish+0x68/0xc0
[  940.586339]  ipv6_rcv+0x70/0x228
[  940.589536]  __netif_receive_skb_one_core+0x68/0x90
[  940.594366]  __netif_receive_skb+0x28/0x80
[  940.598422]  process_backlog+0xe4/0x240
[  940.602220]  net_rx_action+0x120/0x4a8
[  940.605933]  __do_softirq+0x11c/0x580
[  940.609559]  do_softirq.part.3+0x94/0x98
[  940.613442]  __local_bh_enable_ip+0x12c/0x138
[  940.617756]  ip6_finish_output2+0x220/0xb98
[  940.621898]  __ip6_finish_output+0x1e8/0x2a8
[  940.626126]  ip6_finish_output+0x38/0xd0
[  940.630010]  ip6_output+0x80/0x350
[  940.633378]  bpf_lwt_xmit_reroute+0x2a8/0x4b0
[  940.637692]  bpf_xmit+0x120/0x178
[  940.640972]  lwtunnel_xmit+0xd0/0x210
[  940.644600]  ip_finish_output2+0x488/0xa80
[  940.648654]  __ip_finish_output+0x204/0x318
[  940.652795]  ip_finish_output+0x38/0xd0
[  940.656592]  ip_output+0x108/0x2f8
[  940.659959]  ip_local_out+0x5c/0x98
[  940.663411]  ip_send_skb+0x2c/0xb8
[  940.666778]  ip_push_pending_frames+0x44/0x50
[  940.671093]  raw_sendmsg+0xa7c/0xe20
[  940.674633]  inet_sendmsg+0x4c/0x238
[  940.678173]  sock_sendmsg+0x34/0x50
[  940.681627]  __sys_sendto+0x120/0x150
[  940.685252]  __arm64_sys_sendto+0x30/0x40
[  940.689223]  el0_svc_common.constprop.0+0x7c/0x180
[  940.693967]  el0_svc_handler+0x34/0x90
[  940.697678]  el0_svc+0x8/0xc
[  940.700531] Code: b9001020 f9403fa0 d538d082 f9402400 (f8626813)
[  940.706579] ---[ end trace 8a07ef53f23b6533 ]---
[  940.711150] Kernel panic - not syncing: Fatal exception in interrupt
[  940.717449] SMP: stopping secondary CPUs
[  940.721536] Kernel Offset: disabled
[  940.724989] CPU features: 0x0002,24006004
[  940.728957] Memory Limit: none
[  940.731998] ---[ end Kernel panic - not syncing: Fatal exception in
interrupt ]---


[1] https://lkft.validation.linaro.org/scheduler/job/760547#L23242

Best regards
Naresh Kamboju
