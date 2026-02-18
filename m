Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52FF32142B
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 08:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404812; cv=none; b=R6/MqL8NMGtDDwN8rUNNHv8bJ7FXa3bgrKAQPnr4GUETYRkh1YB+rFAtLJMvCDNT5wcMTLqYnJoKJdur25mi6OEwGppUBO9fzLAbaTE6Xv+VO88UtYRdUvRwVla7sX0v+vk4mjls4jON4l8+3WU9ZCzRoechpE6qxOo3g55Vb7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404812; c=relaxed/simple;
	bh=iQEu9sK0el/ZMJGNvB7jdDbu+NWiJ9V3mssdW5IM8yU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=minzvGNMc0tHNNm1rpkF6GtPaHPCGoO35mV7SeqcRbreuy29H/9RazfCTJ5Az8I10VcJkihvGJ3mduxT/kjLIl18WPsPw6F8PLC7moXuGcJ80uD6dfGRQM0gBGJH0bOZJST8pHNkuM4HrMe8MtTe8/MNqX1+f8cYI3PyVptdpi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=VYPGiaEE; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=sbbueX7S; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="VYPGiaEE";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="sbbueX7S"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1771404801;
	bh=iQEu9sK0el/ZMJGNvB7jdDbu+NWiJ9V3mssdW5IM8yU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VYPGiaEEpKbx4tJ+Bl4HSZhRk5smSXiR1kyIzwu5G5GYzbBwVYaTiUL3uWveYRXBq
	 g9p8nYk2HBSKCNm6mWXc5X4h4ubc6hnA7gLX+xGyeTbohvlOXtC4MC/I7Bty2V4Jg3
	 pSWPkBV046ks1eROL2k3pZf21qztyt5RZQqAS7ubTZ89t9AXHUUtYlYWBdIzTePLc0
	 u10UKQPkBPNjiZaXapXJ/pwDdGVGUe1/0aMPCU/oNs3Vv0+X/FLDNl9tw+GEf9AoRy
	 rWRR8HYGV90aR33YDPvRAM5TelgWW39Q5VGa6JS3MX442+c1afu7ICLU9IuExKN4UQ
	 4f80Vq/uZVUEKdqf+n10hzy123jWBVAFewLAALgYH8IDRsatnqKADGE3DIvXKtFX/7
	 WgfXSmVo7fMgU52kdqIcz+KRbDrHcr4DUcwYctn0Wzf0TerWgj/1E8qTQeqixPYLxS
	 O8tgINRZQmDWE6J08MazaUTVKxpILLy6OXd25rCU6/lbRrwzz7uyprEPY9aSlQli/u
	 GXaoneUJb1i+CxRlSprjbr/mp8+MoM3M8PNHXj10NG52dqrmqfzzAmai0fj2zHSpvQ
	 4LrYIfbUaleTpF352gKOtZYCf7SXYGN7yGQR4on8yCSorJOerdJoPDUm15HBUKpeT4
	 441HyoPFfutHro20KxSLShP0=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 09A2C1E76B5; Wed, 18 Feb 2026 16:53:21 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1771404799;
	bh=iQEu9sK0el/ZMJGNvB7jdDbu+NWiJ9V3mssdW5IM8yU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sbbueX7SQGNjNrIcAWPnDdxD/0wwF8p7fGL8fpKBbjkkPsQMsuPxTPvTTaiQx8pEW
	 MMJErCFraye862zwM7kzIKvOSg9D+ZykOlI5VknUiiAXDMXkTcTu8BHN5aKIXCM0Kx
	 wWSHeS3CQnoGwY53cjzXYMYffVsoPywfwrF11/LCymX59LuBjjVGcMXCuTCBxxpWkJ
	 r93YybUaX1ySo7QoHcxIHi22qGlblqY15TTWjJBgviR0J8iqFCMLNTVqxenqBxC2mL
	 EZYFTlHSKT7fymKD98oNK4VpDJW8TqHOnPpKCSDrtRYvfPcxmwknhpyLSEDdmYib3s
	 55FKAKhZVf5GmPAtjDriMlJkbUbsUFh05K6qv/k89h7TbZjr40nZdYQu32lycYbKTE
	 Of6G7Jdu23E3RmFO7wWGE0UhV5Gy2zpwbTsEbRN2uHj72GnR0/5ZtyQczehad8kH/V
	 vLX977849uE+0PRuvc+t2PxKV2elF8g/egz9ZGNBWTqHyWYI3KqkIpaIDbTVFyM/D+
	 u/SKUSmxosHcQtzQj/K9nmKVLfEfTzOQmGm0/d9trezosk1dgJezyQlNAmSjTG4TBy
	 F99FD/UZRX/u/dsZbmD9hsONNLyTqqlQyA0frm1CtcMUMfa5aVf+ziaW9BxXmWbxjM
	 9pmIpNBWpQdRuesltwPC5sxI=
Received: from [IPV6:2001:8003:8824:9e00::bec] (unknown [IPv6:2001:8003:8824:9e00::bec])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 9DE971E76FA;
	Wed, 18 Feb 2026 16:53:19 +0800 (AWST)
Message-ID: <59e8c352-7bc8-4358-af74-fee8c29280ba@davidgow.net>
Date: Wed, 18 Feb 2026 16:53:16 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RCU stalls running KUnit on mainline
To: Mark Brown <broonie@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
References: <b537dc5a-f7e2-4daa-bff1-d07c5852ece5@sirena.org.uk>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <b537dc5a-f7e2-4daa-bff1-d07c5852ece5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 17/02/2026 à 10:10 PM, 'Mark Brown' via KUnit Development a écrit :
> Hi,
> 
> When running KUnit via qemu on current mailine I'm seeing random
> lockups, frequently but not always reporting an RCU stall.
> Unfortunately these don't seem to happen in a consistent place which
> makes it hard to figure out exactly what's going on, they started in
> -next at some point shortly before or early in the merge window but I've
> never managed to drill down and investigate them.  I don't imagine
> they're due to KUnit specifically, though it seems likely some test is
> triggering them.  Has anyone else seen this, or do you have any leads?
>

Hmm… I haven't seen this yet on x86_64, but looking at arm64 and 32-bit 
i386, I do see a sporadic panic, often with rcu in the stacktrace. Seems 
to happen more often when the KUnit test kthread is starting/stopping 
(particularly, at least on i386, if it's due to a trapped fault).

I've not been able to reproduce it after reverting the kthread affinity 
series (git revert -m1 d16738a4e79e55b2c3c9ff4fb7b74a4a24723515), but 
that could just be due to luck. It's flaky enough that my attempt at 
bisection kept pointing at documentation patches.

Frederic, any idea if the 7.0 kthread updates could be causing these? My 
most reliable repro command thus far is:
./tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1

— David

