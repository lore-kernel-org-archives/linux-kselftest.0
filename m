Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085236;
	b=KsTfY6uo3c6MxPAIkttIFcTwKvtITswi3HqU+wXuXQH6ngd/cQsJAO3AUp7ZC8sDRYie
	 tjwpy719JkuQkHpnfp+1bk74OZ58c9gFJy+k4WkiFSzR7qWXD5gVD4fAa7khHA4ICgqY0
	 ZnHNvW4j1EN/9Z+yItvLdoCrUrelyLyq3+2W3l4t3SHylI0hGh85XcFPjkJprNo26riQG
	 MWYr8Fher0w79uHRl4JX5YlZftzz1aKSJsBH14/tbUxA1Mk9EmvDZndR85BH5JP99JNJQ
	 qt5Z7HjGllbGY7iocZZZvbbfUYEEzn4gWYnSKL3U60H/xD0RNy5+GebVj5c/IMnSf0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=67I3bNEfcu+N7yXs6EAi+/lBjbBrobM44S6SPv9jyFg=;
	b=aB38R34MR5LMvLkyHUe2LddKbLnbJefVufPnglRr8582PePmfmigjRk6nTX8HeODj5Yc
	 TXO6J6QHN7cQVMKBYknl60ZoDJgVbpQ1ImUHKdrAVb5DrWhwVYCrEMYwPWJdXzrtHuGnL
	 odMDSilmfCW3EFQ8mv4CsX7OVpSo7A0DFtCw4NhBYjm7q2ctUYql1Wy+lGSvhbUkGZNBk
	 olFPImklMeQETAQA/mV/tjymsTlPc9twLoN4qNtwNk0MWd4ejqQ9UCTWGn7edLmwmsjyl
	 NQtb0lA+VK85NYwIIK/bxfHKt9vbn4WGddN2WMl293Z6Awl5s2HgpKszw/tGD3fwCQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--halg.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NdNKDppB;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5683C606A320
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 10:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5683C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--halg.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NdNKDppB
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb6bbc025aso18723805e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 02:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795085235; x=1795690035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=67I3bNEfcu+N7yXs6EAi+/lBjbBrobM44S6SPv9jyFg=;
        b=NdNKDppBshR3yFJ0FfbOWsYgjw9irAEaVT/7IxVBjACSprcjw70nJAaThe4TTE+dBk
         UInzrM8KIqiFSmvFBXVwwQFzSfHXLRF4YLznNEgsA197A1YdVcYipcpKCnel74Lh3uP3
         IJU8KmNQDE6rlRrjF6eygat4qW2/xwIgaKCTrFmzkS0v7LtEztyWb9t1xJsPCF5aMRuU
         AIOVlCWj4gpRfMcPCpCzLg8bap7PiOOE6JeYbZy0QxdKAoWH1AASpuiixOTlS7ayd7/G
         VorTt3PcndgbOdBiGT0Q/3kekAtTPAvN9t/QClLjiNey7MLYcj9IijV1Jh+gIk3Z/tIK
         upLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795085235; x=1795690035;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67I3bNEfcu+N7yXs6EAi+/lBjbBrobM44S6SPv9jyFg=;
        b=VCoSdJFKs3TUGvs2smymuBwOj9ndmcpfbGhPg1PTKfd8UzrzAghLLDUcsfI06EuIIy
         3DbEJgGZ/Ekz4nDce7DBBxnR9DiD3JF06n4NCClQ9WOTGopbL0m0Vd/FjzRsZiJEdMew
         HWKM9aa0WPAsifGJkj9C2oPt43ZyMIe36wsb3+a9/pNn/DmMHk6VseKgXQc2CoFiF/pj
         I/I3112r/o7WtTIdYac5cj5naCqPd/eyxjJQPDW+V2FsK8thkwnnhmnB/uQHJHhpv5K2
         wQw9dVSHkPzp/+AjsZ6hTvrN5D3664TOqISANRJFoUcsO+z/IyW+SbUvtKefTzEi5VvV
         7OTA==
X-Forwarded-Encrypted: i=1; AL+hErHPHGdQe863+3z5BGCMjr8k7gqjnR8FWljqipo8jAd/rga9jWY+eZzdd4ahtQUMZ85h1ZL2ldbEitIWtTCqiU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cMAiJeiWxBA9OHLC/hHPb6LwYSSM6LTzYvolrwCIQRLkpSqTm
	AdCYkryyLkPrSn+KGN97B1Lu3UiPHBowkxoi3WQzcjndFfZgPVX8VI9BH6PJNswDCWj5OIIC2Q=
	=
X-Received: from wmwb7-n1.prod.google.com ([2002:a05:600d:4447:10b0:4a1:a2ef:38dc])
 (user=halg job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e56:b0:4bb:7581:2bb9
 with SMTP id 5b1f17b1804b1-4bb7da3003emr104763395e9.22.1795085234352; Thu, 19
 Nov 2026 02:47:14 -0800 (PST)
Date: Thu, 19 Nov 2026 10:47:13 +0000
In-Reply-To: <20261118.faiBee9Taigh@digikod.net>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com> <20261107.aighieG4Ami1@digikod.net>
 <20261118.faiBee9Taigh@digikod.net>
Message-ID: <av7TsXKUE69lyiWl@google.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
From: "Hallgrimur H. Gunnarsson" <halg@google.com>
To: "=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack@google.com>, KP Singh <kpsingh@kernel.org>, 
	Jonathan Calmels <jcalmels@3xx0.net>, Casey Schaufler <casey@schaufler-ca.com>, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-api@vger.kernel.org, containers@lists.linux.dev, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 03:43:03PM +0100, Micka=C3=ABl Sala=C3=BCn wrote:
> Hallgrimur, could you please explain why your use case would not work
> with Landlock?  The capability split or new clone flags would be
> complementary of course.

Apologies for the late reply.

Landlock's capability restrictions work well for self-sandboxing
applications and launchers. The main gap for our use case is setting a
host-wide default for unprivileged user namespaces while still permitting
exceptions. Because Landlock restricts all capability use (not just
capabilities acquired via user namespaces) and its domains are strictly
irrevocable, PID 1 cannot apply a default policy at boot without
locking out privileged services, file-capability helpers, and authorized
workloads. Using Landlock here would require explicit opt-in enforcement
at every unprivileged transition boundary (SSH, container/job launchers,
etc.), where missing any entrypoint leaves unprivileged user namespaces
unrestricted.

In v1 we had the global sysctl to tackle this. In v2 (based on Christian
and Andy's feedback), we combine per-cred cap_userns with per-userns
cap_bset), and PID 1 or a service manager can lower the default userns
ceiling once at the root of the process tree, while privileged tasks
automatically retain capabilities held in cap_permitted and can
explicitly raise cap_userns for authorized workloads unless locked.

Another minor difference is visibility. Clamping the task's capability
sets on userns entry (and exposing CapUns in /proc/<pid>/status in v2)
makes it easy for userspace to inspect what is actually restricted.

