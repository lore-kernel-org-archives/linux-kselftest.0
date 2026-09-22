Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDE532C8B;
	Tue, 22 Sep 2026 02:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790043049; cv=none; b=qDaZ0+vCdmNp7esw0id+5P/LHZzEwgTfz4sO1c61/Oz+Fmvho9WI6wFqNfG86rgmBWgqwuOcqjnluA9bG2Z0gEvPE3Ld3jw+1ZLMvvSRke9mXlyKUoggsn7fchMsemgoLANE1SPZmYBMdAYAyNqHPs8fF5Lo7eF6eUjr1t9LpPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790043049; c=relaxed/simple;
	bh=hrfhzEUJqTs/DKpP5exUq/bKUOs+CXIyZRtzmd58Vig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UQdE175UwoPvU5ss6ooKdM7ffx0amBhPN8mkIJ/sJNOn/sbPh7cnmYdj7S6roYUE3ryb0FrI8slIsPXYi7kdVCQE0AiDJ12FZXnuroeS5Z9qTkj/frKwpy4BNthMtbREZeizDc0OmgAD8swtMGHAtbFdWp6CmAaH+d66Xsj7U8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: cd3acfe0b62a11f19a56ed5b684f684d-20260922
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d478da15-ce41-448a-844d-42766b03949a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:4c2d77835c1ea1cff42846d3f0008cf5,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0|15|52|99,
	EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cd3acfe0b62a11f19a56ed5b684f684d-20260922
X-User: fuqingshuang@kylinos.cn
Received: from [10.42.20.11] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fuqingshuang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1407474148; Tue, 22 Sep 2026 10:10:37 +0800
Message-ID: <347bbe05-c11d-4f28-b867-da02b445af34@kylinos.cn>
Date: Tue, 22 Sep 2026 10:10:34 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] selftests: net: fou_mcast_encap: load the fou
 module
To: netdev-bot+sashiko@kernel.org
Cc: apw@canonical.com, joe@perches.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, willemb@google.com, littlesmilingcloud@gmail.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260917033049.792209-1-fuqingshuang@kylinos.cn>
 <178996230975.2160803.17640968761180621275@kernel.org>
Content-Language: en-US
From: Qingshuang Fu <fuqingshuang@kylinos.cn>
In-Reply-To: <178996230975.2160803.17640968761180621275@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2026/9/21 11:45, netdev-bot+sashiko@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 0 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The new IPv4 gate in
>    tools/testing/selftests/net/fou_mcast_encap.sh (`if modprobe -q fou;…
> - [Low] The IPv4 subtest is now gated solely on the exit status of
>    `modprobe -q fou` (tools/testing/selftests/net/fou_mcast_encap.sh:162).
> 
> --
> 
> selftests: net: fou_mcast_encap: load the fou module
> 
> The patch replaces the unconditional IPv4 subtest invocation in
> fou_mcast_encap.sh with a modprobe -q fou guard, running setup_ipv4() and
> run_ping_test() only when the modprobe succeeds and calling log_test_skip()
> otherwise.
> 
> Link (v1): https://lore.kernel.org/all/20260911100158.854183-1-fuqingshuang@kylinos.cn/
> 
>> diff --git a/tools/testing/selftests/net/fou_mcast_encap.sh b/tools/testing/selftests/net/fou_mcast_encap.sh
>> index 70210d39fba33..5f84d58d3075b 100755
>> --- a/tools/testing/selftests/net/fou_mcast_encap.sh
>> +++ b/tools/testing/selftests/net/fou_mcast_encap.sh
> 
> [ ... ]
> 
>> @@ -160,8 +158,13 @@ run_ping_test() {
>>   }
>>   
>>   setup_common
>> -setup_ipv4
>> -run_ping_test -4 eoudp4 "$TUN4_R" "FOU/GRETAP IPv4 multicast encap resubmit"
>> +
>> +if modprobe -q fou; then
>> +	setup_ipv4
>> +	run_ping_test -4 eoudp4 "$TUN4_R" "FOU/GRETAP IPv4 multicast encap resubmit"
> 
> [Severity: High]
> 
> Does this guard actually cover the CONFIG_NET_FOU=m case described in the
> commit message?
> 
> The encap ops needed by "ip link add ... type gretap ... encap fou" are only
> compiled in under CONFIG_NET_FOU_IP_TUNNELS:
> 
> net/ipv4/fou_core.c:
> #ifdef CONFIG_NET_FOU_IP_TUNNELS
> 	... fou_iptun_ops / gue_iptun_ops ...
> #else
> static int ip_tunnel_encap_add_fou_ops(void)
> {
> 	return 0;
> }
> 
> and net/ipv4/Kconfig has:
> 
> config NET_FOU_IP_TUNNELS
> 	bool "IP: FOU encapsulation of IP tunnels"
> 	depends on NET_IPIP || NET_IPGRE || IPV6_SIT
> 	select NET_FOU
> 
> Since a bool=y selecting a tristate forces it to y, doesn't CONFIG_NET_FOU=m
> imply CONFIG_NET_FOU_IP_TUNNELS=n?
> 
> In that configuration the module init still returns success and registers no
> TUNNEL_ENCAP_FOU ops, so modprobe -q fou exits 0, setup_ipv4() runs, and:
> 
> 	ip -n "$NSENDER" link add eoudp4 type gretap \
> 		remote "$MCAST4" local 10.0.0.1 \
> 		encap fou encap-sport "$FOU_PORT4" encap-dport "$FOU_PORT4" \
> 		key "$MCAST4"
> 
> still fails, because ipgre_newlink_encap_setup() -> ip_tunnel_encap_setup() ->
> ip_encap_hlen() returns -EINVAL when no ops are registered for the encap type.
> 
> setup_ipv4() checks none of its command exit statuses and the script does not
> use set -e, so get_rx_packets() yields an empty string, rx_delta becomes 0, and
> run_ping_test() logs exactly the line quoted in the commit message:
> 
>    TEST: FOU/GRETAP IPv4 multicast encap resubmit (received 0/100)  [FAIL]
> 
> The commit message also states:
> 
>    This matches the existing fou6 handling in this script and the pattern used
>    in pmtu.sh.
> 
> setup_fou_or_gue() in pmtu.sh does both halves:
> 
> 	modprobe fou || return $ksft_skip
> 	run_cmd ${ns_a} ip fou add port 5555 ipproto ${ipproto} || return $ksft_skip
> 	run_cmd ${ns_a} ip link add ${encap}_a type ${type} ${mode} local ${a_addr} remote ${b_addr} encap ${encap} encap-sport auto encap-dport 5556 || return $ksft_skip
> 
> Only the modprobe half is adopted here, and that half cannot express the
> CONFIG_NET_FOU_IP_TUNNELS gate. Would a capability probe, mirroring
> setup_ipv6() and returning $ksft_skip when the "ip fou add" or the gretap
> creation fails, work better for this?
> 
> As an aside, the IPv6 branch only degrades to a skip incidentally: the last
> command in setup_ipv6() is
> 
> 	ip -n "$NSENDER" neigh add "$TUN6_R" lladdr "$recv_mac" dev eoudp6
> 
> which fails when the tunnel was never created, so setup_ipv6() happens to
> return non-zero.
> 
>> +else
>> +	log_test_skip "FOU/GRETAP IPv4 multicast encap resubmit"
>> +fi
> 
> [Severity: Low]
> 
> The commit message says:
> 
>    modprobe is a no-op when CONFIG_NET_FOU=y, so default selftest builds
>    remain unchanged.
> 
> Is that accurate when /lib/modules/$(uname -r) is not populated?
> 
> With CONFIG_NET_FOU=y (which is what tools/testing/selftests/net/config sets),
> modprobe can only resolve a built-in module name through the modules.builtin
> files and modules.dep that depmod generates during make modules_install. On a
> freshly built kernel booted without installing modules, or on a minimal
> initramfs or VM image where modprobe is not on PATH (exit 127), modprobe -q fou
> returns non-zero even though FOU is fully available, and this else branch is
> taken.
> 
> In that case setup_ipv4() and run_ping_test() never run, so a real regression
> in the __udp4_lib_mcast_deliver() resubmit path would be reported as a clean
> skip. The -q also suppresses any diagnostic, unlike pmtu.sh which uses plain
> modprobe.
> 
> Would running modprobe -q fou for its side effect only, and then gating the
> subtest on an actual capability check, avoid turning a working built-in
> configuration into a skip?
> 

Thanks for the review. The patch has been merged.
These are fairly niche corner cases. I'll hold off on a follow-up for 
now unless real-world bug reports surface.

Regards,
Qingshuang Fu
