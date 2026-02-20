Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1362E20D4FC
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 15:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771601430; cv=none; b=GLny3hT7P+jXy0eJ2ZDKAalDZNuQYarnhqTHAigg9H2JirKAGYolDK5OOZBuxkYnZdyWm+ly9hKwW+RoyCrmD5iu9rUBVgFt3UUIgSIILgi4KHFMZg5iRhaGVYeBci9sBUIEr35v5tleOFmkbFNL/7QD7Py08Mprlo/4sZ8jzck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771601430; c=relaxed/simple;
	bh=aqCX+kTisIz/XXfBEkpgMnNKTadVmMHan1Q+gHIO+mY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SdX7zA3MXDfvFDMUxXiXUwySME9P0zhYJWWwavSUOdk7y+2gn9vC+1C2L4OAvzOmehrj15a2viIwAw+bc+u2HVbIxNT/K9YnP1CL4I81KStyHMO0x9BkRStwtfcUZB5eFbYnzKig05a7NdmY2GbujqxetI824zhKaipp5AkzJ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=pc646Dk2; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="pc646Dk2"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11AED4432F;
	Fri, 20 Feb 2026 15:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1771601420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wt/Ullnpfc3ghlaqaB6HpOfbfhVooeAuBr5LmUyzlC4=;
	b=pc646Dk2w7nd/XIx1QtoZBkJA96LG1lUBF4Nt3+SgTGkMUEqvbH6MQgZZnWk7Fu91Hu7ov
	MdrEI7GVd7nzivO2kWsXzvgp0I7CemVP7kE7nTTTcxl1Mek6PXKzM8j0TSnfMyrTjOa4c1
	Op45bRDzWF/ry4N+sDOPAfjmnuEYml8509z20S5cKKAPfVdZtxsnvL2gnZZixAcny9nA4Q
	IYN4oBmuH7+aS/J7bQ7IuATduDVBZlD3I1DvblRfMffDua9JzbrmWSv8w7nNmAV1HX6lCb
	El0tIffgPmuUM8nRxsL3NaiMuOK/ouzpQJcNmwaQ/fHQsZDskFBJWu5J9OLAKA==
Message-ID: <cb63d5d8-d174-4d65-b5a3-877533f6cbd7@gtucker.io>
Date: Fri, 20 Feb 2026 16:30:19 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RCU stalls running KUnit on mainline
To: Mark Brown <broonie@kernel.org>, David Gow <david@davidgow.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
 Rae Moar <raemoar63@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
References: <b537dc5a-f7e2-4daa-bff1-d07c5852ece5@sirena.org.uk>
 <59e8c352-7bc8-4358-af74-fee8c29280ba@davidgow.net>
 <8aa71ce7-7c83-4446-b1fa-b0f862bde53f@sirena.org.uk>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <8aa71ce7-7c83-4446-b1fa-b0f862bde53f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdekkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhohgjtgfgsehtkeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepudelgeevueetfeffffejfffhjefhjeejvedtleeghfejleeutddtgffgvdeiueevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmeeivgehheemrggvrgehmeduuggsleemtghfvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegrgegtdemkeeivddtmeeivgehheemrggvrgehmeduuggsleemtghfvddtpdhhvghloheplgfkrfggieemvddttddumeekiedumeegrgegtdemkeeivddtmeeivgehheemrggvrgehmeduuggsleemtghfvddtngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepuddutefgffeggeefvdfhpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepjedprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopegurghvihgusegurghvihgughhofidrnhgvthdprhgtphhtthhopegsrhgvnhgurghnrdhhihhgghhinhhssehlihhnuhigrdguvghvpdhrtghpthhtoheprhgrvghmohgrrheifeesghhmrghilhdrtghomhdprhgtphhtthhopehfrhgvuggvrhhitgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhhsvghlfhhtvghsthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-State: clean

(sorry, resending but not with gmail)

Hello,

On 18/02/2026 20:31, 'Mark Brown' via KUnit Development wrote:
> On Wed, Feb 18, 2026 at 04:53:16PM +0800, David Gow wrote:
>> Le 17/02/2026 à 10:10 PM, 'Mark Brown' via KUnit Development a écrit :
>>> When running KUnit via qemu on current mailine I'm seeing random
>>> lockups, frequently but not always reporting an RCU stall.
>>> Unfortunately these don't seem to happen in a consistent place which
>>> makes it hard to figure out exactly what's going on, they started in
>>> -next at some point shortly before or early in the merge window but I've
>>> never managed to drill down and investigate them.  I don't imagine
>>> they're due to KUnit specifically, though it seems likely some test is
>>> triggering them.  Has anyone else seen this, or do you have any leads?
> 
>> I've not been able to reproduce it after reverting the kthread affinity
>> series (git revert -m1 d16738a4e79e55b2c3c9ff4fb7b74a4a24723515), but that
>> could just be due to luck. It's flaky enough that my attempt at bisection
>> kept pointing at documentation patches.
> 
> One other data point is that there's some range of commits which
> generates an actual failure in the runtime PM tests:
> 
> [19:26:28] [PASSED] pm_runtime_disabled_test
> [19:26:28] Unable to handle kernel execute from non-executable memory at virtual address fff000000145f358
> ...
> [19:26:28] Call trace:
> [19:26:28]  0xfff000000145f358 (P)
> [19:26:28]  rpm_callback+0x74/0x80
> [19:26:28]  rpm_resume+0x3cc/0x6a0
> [19:26:28]  __pm_runtime_resume+0x50/0x9c
> [19:26:28]  device_release_driver_internal+0xd0/0x224
> [19:26:28]  device_release_driver+0x18/0x24
> [19:26:28]  bus_remove_device+0xd0/0x114
> [19:26:28]  device_del+0x14c/0x408
> [19:26:28]  device_unregister+0x18/0x38
> [19:26:28]  device_unregister_wrapper+0x10/0x20
> [19:26:28]  __kunit_action_free+0x14/0x20
> ...
> [19:26:28] [FAILED] pm_runtime_error_test
> 
> which might upset bisections.

Yes, although I've run some automated VIXI bisections and found one
reliable panic in rcu.  I had to do it in two steps as the first
bisection landed on a merge commit.  After a bit more investigation I
reported what I found here:

    https://lore.kernel.org/all/0150e237-41d2-40ae-a857-4f97ca664468@gtucker.io/

I can bisect the other KUnit issues separately too if that helps now
that I have a quick workaround to avoid this panic (see email).

Cheers,
Guillaume
