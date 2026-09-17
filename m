Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453963AA9E2;
	Thu, 17 Sep 2026 03:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789616008; cv=none; b=qx/S69hRkpmG6P7lREGr+t1fGKE6kvi3EdYDhVfXf1oQg21Ki0C/P47seSI0cw79NMpw8k9fkon4BZFC3UvcdmSR2JEJQM0qhcIzxA9iSCxlIQt5rt4eHnrawdvcf8DWmes+fMGfZ1Wnj/yhlL4vKpnpM/Tg5oq0UJddigF+qaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789616008; c=relaxed/simple;
	bh=pblrRIvc/KFyk5uyOrAFvhoVvjb8iomLT5e4rninGmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EYxzFtTmZRwBn5ZaRKl8oPHyBodn9tC7wbQBBzu4/dE7bAFGsDDk3XQPYotFxV8WPrgCUFJuO9+nt2dM8pejt0oAUGIfWf+lsQEAhPwNbaxLJYYm0VfuZJWjASNGQFEKeAsiWeVO5knc8UFqnhnOtkecNp4NgEXWlr4PkdrY5tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 82d89ca6b24811f19a56ed5b684f684d-20260917
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:f722b57f-4f92-4d1b-bf64-8c6d5161a21a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:f0b986f2f66782a0521ce0bad8a90f0d,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|136|865|898,TC:nil,Content:0|15|52
	|99,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 82d89ca6b24811f19a56ed5b684f684d-20260917
X-User: fuqingshuang@kylinos.cn
Received: from [10.42.20.11] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fuqingshuang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 2134447221; Thu, 17 Sep 2026 11:33:12 +0800
Message-ID: <14cff809-d338-4a95-8e7d-10759615b394@kylinos.cn>
Date: Thu, 17 Sep 2026 11:33:09 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: net: fou_mcast_encap: conditionally load fou
 module and skip IPv4 case
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Willem de Bruijn <willemb@google.com>,
 Anton Danilov <littlesmilingcloud@gmail.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260911100158.854183-1-fuqingshuang@kylinos.cn>
 <20260916174029.78939f6b@kernel.org>
Content-Language: en-US
From: Qingshuang Fu <fuqingshuang@kylinos.cn>
In-Reply-To: <20260916174029.78939f6b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2026/9/17 08:40, Jakub Kicinski 写道:
> On Fri, 11 Sep 2026 18:01:58 +0800 Qingshuang Fu wrote:
>> Fixes: e5382133c51c ("selftests: net: add FOU multicast encapsulation resubmit test")
> 
> No fixes tag, please, this is barely worth applying at all, let along
> as a fix.
> 
>> diff --git a/tools/testing/selftests/net/fou_mcast_encap.sh b/tools/testing/selftests/net/fou_mcast_encap.sh
>> index 70210d39fba3..d94c19237daf 100755
>> --- a/tools/testing/selftests/net/fou_mcast_encap.sh
>> +++ b/tools/testing/selftests/net/fou_mcast_encap.sh
>> @@ -51,8 +51,6 @@ setup_common() {
>>   }
>>   
>>   setup_ipv4() {
>> -	# IPv4 FOU (CONFIG_NET_FOU) is built in on kernels configured for
>> -	# these tests, so no module load is needed here.
>>   	ip -n "$NSENDER" addr add 10.0.0.1/24 dev veth_s
>>   	ip -n "$NRECV" addr add 10.0.0.2/24 dev veth_r
>>   
>> @@ -160,8 +158,17 @@ run_ping_test() {
>>   }
>>   
>>   setup_common
>> -setup_ipv4
>> -run_ping_test -4 eoudp4 "$TUN4_R" "FOU/GRETAP IPv4 multicast encap resubmit"
>> +
>> +# The fou module registers both the tunnel encap ops used by "encap fou"
>> +# and the FOU genetlink family used by "ip fou add", and neither of them
>> +# is auto-loaded. modprobe succeeds as a no-op when CONFIG_NET_FOU=y.
>> +# Keep any other setup error as a test failure rather than a skip.
> 
> Drop this comment please, its obvious. Well, to people with basic
> kernel familiarity it is.
> 
>> +if modprobe -q fou; then
>> +	setup_ipv4
>> +	run_ping_test -4 eoudp4 "$TUN4_R" "FOU/GRETAP IPv4 multicast encap resubmit"
>> +else
>> +	log_test_skip "FOU/GRETAP IPv4 multicast encap resubmit"
>> +fi
> 
> Two very important questions you must answer before posting v2 or any
> other similar fix:
> 
> Have you actually run into this or it's a result of an LLM scan?
> 
> How many of such fixes would we need to make all the net/ tests
> clean from similar issues?

I noticed it reading the script, then reproduced it on 6.8.0-138-generic.
This Ubuntu kernel ships with CONFIG_NET_FOU=m by default. Without the fou
module loaded, tunnel creation fails with "RTNETLINK answers: Invalid 
argument"
and the test reports a false failure at 0/100 packets. After applying 
the patch
the subtest skips cleanly.

For FOU this was the only gap. The two other net/ tests that use it
(pmtu.sh, rtnetlink.sh) already load the module.

v2 sent: drop Fixes tag and the in‑script comment as requested. Thanks 
for the review.

Regards,
Qingshuang Fu
