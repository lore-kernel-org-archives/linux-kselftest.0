Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3083AE189;
	Fri, 18 Sep 2026 01:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696344; cv=none; b=JmAFOxPbUIzT3nQlWRbX2Fe2QYz8GZKYJp18md42S0cLhNqva4jY+4RVJR7aAmj4njxVtbPNl1+iTRHPIgP92gwe3pV1xiKciAnUR7f1KpjuA1+P5+dGJBZtmLVEoh3ZV3ra08CGVNWI6j797pV3lWwKrm/sivqAsulk2V/Xp5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696344; c=relaxed/simple;
	bh=e/lRjJ3+0ylDa5qqKZe3WO1iGQ/o0RNmydhQSJdETcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skl1oPIiL5h4x2jVvVcMqm8BhZbJl8EWtP7XlUgmdy/XCOuL0CM2JB2CKJiEapwat8KU+Uqhi2iRF07og5HRFHny7RjgiK71hbw1BQCwfaXpr8vz/jS4NABJWnDRdGqtupXYA6ROzXVHXkFefyOFxYTlyjKDi8PMBqd7WCR4vcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8e99a290b30311f19a56ed5b684f684d-20260918
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:743c455c-ddcc-4a3f-90c8-a9647306c3b1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:3acd2fdb907b06de407f209f64066ba7,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|136|865|898,TC:nil,Content:0|15|52
	|99,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8e99a290b30311f19a56ed5b684f684d-20260918
X-User: fuqingshuang@kylinos.cn
Received: from [10.42.20.11] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fuqingshuang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1751355845; Fri, 18 Sep 2026 09:52:08 +0800
Message-ID: <b33bba50-38ce-477a-be0d-ec4eeb0703b1@kylinos.cn>
Date: Fri, 18 Sep 2026 09:52:05 +0800
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
 <14cff809-d338-4a95-8e7d-10759615b394@kylinos.cn>
 <20260917152439.64d14833@kernel.org>
Content-Language: en-US
From: Qingshuang Fu <fuqingshuang@kylinos.cn>
In-Reply-To: <20260917152439.64d14833@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2026/9/18 06:24, Jakub Kicinski 写道:

> 
> I did not ask about FOU

Apologies, I completely misread the scope.

I've now done a systematic check across tools/testing/selftests/net/.
FOU is the only relevant module lacking any auto-load mechanism
in these tests:

All other tunnel/encap modules (bareudp, vxlan, geneve, gre, ip_gre,
ip6_gre, amt, ifb, xfrm, l2tp) have proper module aliases and can be
auto-loaded via netlink or rtnetlink requests.

In contrast, the fou module has no MODULE_ALIAS_GENL_FAMILY, no
rtnl link alias, and no net-pf-proto alias, so it never auto-loads.

Among the three selftests using FOU, pmtu.sh and rtnetlink.sh already
load the module explicitly, while fou_mcast_encap.sh is the only missing
case.

A naive grep for "encap|tunnel" across the net selftests returns 23
scripts, all of which rely on auto-loading and require no fixes.

> 
> I guess I wasn't clear enough. When I say "before posting v2"
> I was hoping you'd give me a chance to respond too :/
> 
Noted, and sorry for jumping the gun. Won't happen again.

