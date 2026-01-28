Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C509372B20
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 19:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769628769; cv=none; b=UYusLSO5jq3rD5jmenFmuL1K9PLTqrOA7zKgPrUl2dVjn07Uh6muNl0aHzGnRymlnRbcRKkNv3uNMtXURI/ua98G7MtTPmN+vNhXE9dmaV5Zfdsj7/Qce83XfMtex6QPnrPPH3DrDLatiymiRNF2XRQAcFZEVFkHk2WY6r8rA9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769628769; c=relaxed/simple;
	bh=HiiF8oN/JZyzVRZvXlHfT5uyZcuQv5Z1I7+98LRA82w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UXk1wjGR3GDUd0FaDTlbDi3c3z7Icxz8SOGS2cJyXZN9x0J6MCEebCUhRa38zPbHZuqBVaIgwRM6PxUWKFkNTMHJmKZo9IEn3/Hi+UrPj9CMLHjcuIR4x3AhBxZAQP2PrUimbaTC2xFEQs3hqKlgCatgI2psgJf8lVfLE3oVuL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=avqhoBvG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="avqhoBvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769628766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Syj9xoENklbweTYZxw6IJ7gedxjVxbiF9vjxFzyJ5m0=;
	b=avqhoBvGGdmaSHI5W0sI9yW8NJ1rsSar3Iq2chepTdBEII7NzI0poglNNnfXAE/imyEFfn
	iTkgcMLEiiCogtZzqUycA9eeDhouKG3KP/7GdbrHCamqXX4xX9GUOftwqHisBeGxtBm1Vz
	saxLJxhr4H8bxp+LMHcE0FchH0Fk2co=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-mkKBgdSvPEKEb4AIxGEj4w-1; Wed,
 28 Jan 2026 14:32:43 -0500
X-MC-Unique: mkKBgdSvPEKEb4AIxGEj4w-1
X-Mimecast-MFC-AGG-ID: mkKBgdSvPEKEb4AIxGEj4w_1769628761
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5A23218005B8;
	Wed, 28 Jan 2026 19:32:41 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.80.171])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4746830001A2;
	Wed, 28 Jan 2026 19:32:38 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Aleksei Oladko <aleksey.oladko@virtuozzo.com>,  "David S . Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Paolo Abeni
 <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  netdev@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  linux-kernel@vger.kernel.org,
 ovs-dev@openvswitch.org, Ilya Maximets <imaximet@redhat.com>, Eelco
 Chaudron <echaudro@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v2 0/5] selftests: net: fix false failures due to
 missing features and host interference
In-Reply-To: <20260127184448.2976475f@kernel.org> (Jakub Kicinski's message of
	"Tue, 27 Jan 2026 18:44:48 -0800")
References: <20260127225134.304362-1-aleksey.oladko@virtuozzo.com>
	<20260127184448.2976475f@kernel.org>
Date: Wed, 28 Jan 2026 14:32:36 -0500
Message-ID: <f7t1pj9v8h7.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4


Also CC'd Stefano, ovs-dev, Ilya, and Eelco

Jakub Kicinski <kuba@kernel.org> writes:

> On Tue, 27 Jan 2026 22:51:29 +0000 Aleksei Oladko wrote:
>> This series addresses several issues in the networking kselftests
>> that cause false-positive failures depending on the host environment,
>> kernel configuration, or library versions.
>> 
>> The main focus of these changes is to isolate tests from the host
>> environment (using namespaces) and to ensure proper fallback or
>> skipping when dependencies are missing.
>> 
>> Summary of changes:
>> 1. Adds a check for cls_basic module in fib_tests. Without this
>>    module, the test fails when attempting to add tc rules instead
>>    of skipping.
>> 2. Fixes ovs-dpctl.py to return a non-zero exit code when pyroute2
>>    is too old. This allows pmtu.sh to correctly fall back to ovs-vsctl
>>    instead of assuming the configuration was successful.
>> 3,4. Move reuseport and pmtu.sh tests info dedicated network namespaces.
>>    This prevents failures caused by port conflicts with host processes
>>    or interference from host firewall rules.
>> 5. Ensures io_uring is enabled via sysctl before running io_uring_zerocopy
>>    test, preventing failures on systems where kernel.io_uring_disabled
>>    is set.
>
> Something in this series breaks the pmtu test for us in the CI:
>
> # 64.84 [+2.54] TEST: IPv6, bridged geneve6: PMTU exceptions - nexthop objects      [ OK ]
> # 65.73 [+0.89]   ovs_bridge not supported
> # 65.73 [+0.00] TEST: IPv4, OVS vxlan4: PMTU exceptions                             [SKIP]
> # 67.20 [+1.47]   ovs_bridge not supported
> # 67.20 [+0.00] TEST: IPv6, OVS vxlan4: PMTU exceptions                             [SKIP]
> # 68.66 [+1.45]   ovs_bridge not supported
> # 68.66 [+0.00] TEST: IPv4, OVS vxlan6: PMTU exceptions                             [SKIP]
> # 70.11 [+1.45]   ovs_bridge not supported
> # 70.11 [+0.00] TEST: IPv6, OVS vxlan6: PMTU exceptions                             [SKIP]
> # 71.57 [+1.45]   ovs_bridge not supported
> # 71.57 [+0.00] TEST: IPv4, OVS geneve4: PMTU exceptions                            [SKIP]
> # 73.01 [+1.44]   ovs_bridge not supported
> # 73.01 [+0.00] TEST: IPv6, OVS geneve4: PMTU exceptions                            [SKIP]
> # 74.46 [+1.45]   ovs_bridge not supported
> # 74.46 [+0.00] TEST: IPv4, OVS geneve6: PMTU exceptions                            [SKIP]
> # 75.92 [+1.46]   ovs_bridge not supported
> # 75.93 [+0.00] TEST: IPv6, OVS geneve6: PMTU exceptions                            [SKIP]
>
> https://netdev-ctrl.bots.linux.dev/logs/vmksft/net/results/492641/137-pmtu-wrapper-sh/stdout
>
> It was fine before:
>
> https://netdev-ctrl.bots.linux.dev/logs/vmksft/net-dbg/results/492461/6-pmtu-sh/stdout
>
> Since this is a bash test there are of course no logs to go by.. :/

FYI- we can run the script with '-v' and it will include all of the
command output.  That could help understand what is going on if you can
duplicate the [SKIP] behavior in another environment.  I'll try to get
my vmtest environment back up for it.

> I tried running 
>  python tools/testing/selftests/net/openvswitch/ovs-dpctl.py add-dp br0
> in a netns and that works just fine. 

Yes, I tested just changing the ovs-dpctl.py side (no other changes to
pmtu.sh), and then tried with older pyroute2, no pyroute2, and no
ovs-vswitchd userspace to fall back on, and didn't see anything odd on
my end.  I am still nervous that maybe the test is/was passing even in
cases where it shouldn't be.

> No idea what's going on..

+1, the setup_ovs_bridge seems to be returning some kind of error.

NOTE that I was concerned maybe the test would be passing whether or not
the ovs-dpctl was returning '0' (from change 2/5), but I see the
following when I fake out the version check:

========== 8< ===========

[core@centos9 net]$ sudo ./pmtu.sh -v pmtu_ipv4_ovs_vxlan4_exception

##########################################################################

    COMMAND: python3 ./openvswitch/ovs-dpctl.py add-dp ovs_br0
    Need to upgrade the python pyroute2 package to >= 0.6.

    COMMAND: ip link set ovs_br0 up
    Cannot find device "ovs_br0"

    COMMAND: ip netns exec ns_c-VCOwRt ip link add veth_C-A type veth peer name veth_A-C
    COMMAND: ip netns exec ns_c-VCOwRt ip link set veth_A-C netns 1
    COMMAND: ip link set veth_A-C up
    COMMAND: ip netns exec ns_c-VCOwRt ip link set veth_C-A up
    COMMAND: ip netns exec ns_c-VCOwRt ip addr add 192.168.2.10/24 dev veth_C-A
    COMMAND: ip netns exec ns_c-VCOwRt ip addr add fd00:2::c/64 dev veth_C-A
    COMMAND: python3 ./openvswitch/ovs-dpctl.py add-if ovs_br0 veth_A-C
    Need to upgrade the python pyroute2 package to >= 0.6.

    COMMAND: ip netns exec ns_a-kmNqnY ip link set veth_A-R1 netns 1
    COMMAND: ip addr add 10.0.1.1/24 dev veth_A-R1
    COMMAND: ip addr add fc00:1::1/64 dev veth_A-R1
    COMMAND: ip link set veth_A-R1 up
    COMMAND: ip route add 10.0.3.1 via 10.0.1.2
    COMMAND: ip route add fc00:3::1 via fc00:1::2
    COMMAND: python3 ./openvswitch/ovs-dpctl.py add-if ovs_br0 vxlan_a -t vxlan
    Need to upgrade the python pyroute2 package to >= 0.6.

    COMMAND: python3 ./openvswitch/ovs-dpctl.py add-flow ovs_br0 recirc_id(0),in_port(),eth(),eth_type(0x0800),ipv4() set(tunnel(tun_id=1,dst=10.0.3.1,ttl=64,tp_dst=4789,flags(df|csum))),
    Need to upgrade the python pyroute2 package to >= 0.6.

    COMMAND: python3 ./openvswitch/ovs-dpctl.py add-flow ovs_br0 recirc_id(0),in_port(),eth(),eth_type(0x86dd),ipv6() set(tunnel(tun_id=1,dst=10.0.3.1,ttl=64,tp_dst=4789,flags(df|csum))),
    Need to upgrade the python pyroute2 package to >= 0.6.

    COMMAND: python3 ./openvswitch/ovs-dpctl.py add-flow ovs_br0 recirc_id(0),tunnel(tun_id=1,src=10.0.3.1,dst=10.0.1.1),in_port(),eth(),eth_type(0x0800),ipv4() 
    Need to upgrade the python pyroute2 package to >= 0.6.

    COMMAND: python3 ./openvswitch/ovs-dpctl.py add-flow ovs_br0 recirc_id(0),tunnel(tun_id=1,src=10.0.3.1,dst=10.0.1.1),in_port(),eth(),eth_type(0x86dd),ipv6() 
    Need to upgrade the python pyroute2 package to >= 0.6.

    COMMAND: python3 ./openvswitch/ovs-dpctl.py add-flow ovs_br0 recirc_id(0),tunnel(tun_id=1,src=10.0.3.1,dst=10.0.1.1),in_port(),eth(),eth_type(0x0806),arp() 
    Need to upgrade the python pyroute2 package to >= 0.6.

    COMMAND: python3 ./openvswitch/ovs-dpctl.py add-flow ovs_br0 recirc_id(0),in_port(),eth(),eth_type(0x0806),arp(sip=192.168.2.10,tip=192.168.2.2) set(tunnel(tun_id=1,dst=10.0.3.1,ttl=64,tp_dst=4789,flags(df|csum))),
    Need to upgrade the python pyroute2 package to >= 0.6.

    COMMAND: ip netns exec ns_b-gO9WCK ip link add vxlan_b type vxlan id 1 local 10.0.3.1 remote 10.0.1.1 ttl 64 dstport 4789
    COMMAND: ip netns exec ns_b-gO9WCK ip addr add 192.168.2.2/24 dev vxlan_b
    COMMAND: ip netns exec ns_b-gO9WCK ip addr add fd00:2::b/64 dev vxlan_b
    COMMAND: ip link set vxlan_a up
    Cannot find device "vxlan_a"

    COMMAND: ip netns exec ns_b-gO9WCK ip link set vxlan_b up
Cannot find device "ovs_br0"
    COMMAND: ip netns exec ns_c-VCOwRt ping -q -M want -i 0.1 -c 20 -s 4500 192.168.2.2
    PING 192.168.2.2 (192.168.2.2) 4500(4528) bytes of data.

--- 192.168.2.2 ping statistics ---
20 packets transmitted, 0 received, +20 errors, 100% packet loss, time 12790ms
pipe 4

TEST: IPv4, OVS vxlan4: PMTU exceptions                             [FAIL]

