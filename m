Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CAE38DC74
	for <linux-kselftest@vger.kernel.org>; Sat,  3 Oct 2026 22:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791067205; cv=none; b=rdKAP9mB6HF7FFbb+tQxH8HXwixTIKDN4hBfcU/4S8ThUuSLbteGU8pv+NCRxwz5qP1zJtUVyo89i1QF43C3S/Gbki7LqguuQCT234jHY48dNCPFc5Yi6hcwSiHmqLZ7KCT2dnivtK+WVRggnJa+nx8Zs+F+E4o89f9cv/8FUNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791067205; c=relaxed/simple;
	bh=t988az+IkSXq3gTpP/ixKIAHAGj79xMTyDNMRKS3/fg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gtnm66WpC8gtLBsb7Tp7Vgndv6kJFLEVs+MvmvDXrhcm7jG1sPsnkKHHQY4pMvUvSShfXsAI2mSwNPfJQ5/wHimiOCG6z3CSGC/ZgJihMQGXwsjlEkXAiBmW6+1TvHifrwUQwc1mULC5UHhA2WNvrqjMBe3aU5j6j9VjE2UMqt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAmqYGRm; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAmqYGRm"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f38so1951535ad.2
        for <linux-kselftest@vger.kernel.org>; Sat, 03 Oct 2026 15:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791067203; x=1791672003; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n/oIu14jUGCFAHwNtKrIHGbo5GeSCHJZDG7wMHq45NE=;
        b=VAmqYGRmqqhtjpDWL7m1hwONxrM4QRr/xNPEcb3VkhR1x8T6pTJ7+Jg442kV+UW/IR
         XSLR9dXHVPZ5NdvLYwF03LvChP06O3Jz6bhQAYg86+tOjnAPXTWuNdxaYM2RmKOaTSf/
         dYsOxkh8Qu9eLmwyrFir5drhmVol/l11N8hHwUltIpYiQW0omFPS00D12xdrGY0sAx3O
         O9zb5A/HnH3Em4HwbPeXBSBnucLzp2+hZkSuxfhSJQp8BWDfa2fXvRm+LNX0LTpnZMFp
         6Xl14BZ3oRqiPnN7aTdRsMFiEyiAuXSdCwYmT6w9uLAOj8t/GZSK9XhZA4E66Y/uC/xJ
         hAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791067203; x=1791672003;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n/oIu14jUGCFAHwNtKrIHGbo5GeSCHJZDG7wMHq45NE=;
        b=ZQCDafd3fI9JgHRHujs4o0EB5jjyS0HKQfBW5c8jLc3SoLYSS7Bgp6YXiCrd2OgKwq
         xYBMKBDlu8G1+m7uEOdG1NdqPAIEbhoVMFG0nFEYUod6ksJxOn+/8rKOMhcf7sBJT7qe
         hjBdu7MO/1n88u7+BtP84XtxY6ga0yBLZ9MvUGnCVGbwOchlyuW4m5/ocQ2bNckaVOgV
         W4JEXBijRrOc6amAt5svjIEDooJZpxEboKwwa4r8RQURvq9yViExKpgT6119HlyhdVYQ
         XITJR2kjYYcbM81wTm24Pi5HXPZjeGX/S1wkEo1bobyaMCrYQI86unF70sSXgi8jatx5
         UVwQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6O1dTNycBYOA267W+VcQvCT+9BqWNX61YUyiFPuCa5sbkCFW046120Emp/DqdpfFtq5AZHCjBTzMEZekkZCY=@vger.kernel.org
X-Gm-Message-State: AFuF++kgyfI/VbGvUrb2g9OZ4/Wm+GT7xSD7QSFSTC7FQETTMKyO94mh
	7SNcUc7OuEG7x4iEsZLUyy4pO8fL1wEnqOND8I6IcgulJwmqbsgsvFhe
X-Gm-Gg: AYBFou12u6LlMqySPKcMFnfNUNxn23MOabYaeNQr/7kYcAItxn7utIF0BBNExV7PVHt
	ax6dsp9LTt/WrNG8E7daSIWKmaSWxABoBojW+35CLr0vsnDDbwFSEAjLSdJJCxRx+3a24ZC7hMX
	vxaJvym9tVg9wtyCssH8k5/v+RbmmKes32QlhR4oJQybJ2j1Gq7UnIlU6nLF9SkoUr4W+Ukzcpt
	5h/bbgcaf132uf4CzGKxpop+BXVFGGVM8MmY3ugs7gI90cQfiWwX6/3Lj7FBbCMyjoG2QyKzQaS
	TxkFI5ngzRjonnP9JBKqI0ZLyam11J3aHaYlYrocMHj82Je2mCXO6x1IHEOXQnuuaQ0obcyD5Pn
	6c0/8iT8FjFZz28kLc8ajVjuRpKW9KPP+wS319Gem/spIXarjwBbvlIDNqVMZGilS9phQEPJCBl
	n4TjmetSNPi97/oPTzfoIRccylrMn6beNGUHudHp0hwIgdIQbSofOww6TLmzlPqizSAXnjnztR9
	nY0lgcb2bfisQaG1uX8zsHCGwjrl5/genNyFt8pai/wk/l+pw7wF/OPPrkmEx7VJb3tX9RRCtrC
	3GpGRMfDa9mWJ2Qr2ODDtN63cTU99XhslDf73wOJQgiweRWjpY7h5pj5BG3PqkhV9qwbLZZjFok
	ceudgoGvtKBs=
X-Received: by 2002:a17:902:d506:b0:2df:84e0:9034 with SMTP id d9443c01a7336-2e49a7cdc18mr57178595ad.7.1791067203022;
        Sat, 03 Oct 2026 15:40:03 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f7339desm19297455ad.81.2026.10.03.15.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 15:40:02 -0700 (PDT)
Date: Sun, 04 Oct 2026 07:39:57 +0900
Message-ID: <m2qzi62yte.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: david@kernel.org
Cc: ljs@kernel.org,
	geert@linux-m68k.org,
	johannes@sipsolutions.net,
	linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org,
	daniel@thingy.jp
Subject: Re: [PATCH v4 1/2] selftests: run tests on nommu architecture
In-Reply-To: <d6ee0a8f-e7a8-4fa7-88b8-62fb44bfc863@kernel.org>
References: <20260929235711.2287931-1-thehajime@gmail.com>
	<20260929235711.2287931-2-thehajime@gmail.com>
	<bda5eeaa-7868-4d4a-9026-9e99347afd7c@kernel.org>
	<ar4br2vW7yZGd3gt@gremlin>
	<94759bed23f00d2044005e36be6f72f297e092f0.camel@sipsolutions.net>
	<m2se2o3jyc.wl-thehajime@gmail.com>
	<a65f4431-d225-4535-b921-00319ceeb2a2@kernel.org>
	<ar9ldn036SgT-bq1@gremlin>
	<CAMuHMdUKcUxHZKhTEF1gwWrU1o8O6jt6N3r90V5hynrLFdwY0A@mail.gmail.com>
	<ar-bIzYDdlOKUqla@gremlin>
	<d6ee0a8f-e7a8-4fa7-88b8-62fb44bfc863@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


Hello,

On Fri, 02 Oct 2026 21:21:53 +0900,
David Hildenbrand (Arm) wrote:
> 
> On 10/2/26 13:53, Lorenzo Stoakes (ARM) wrote:
> > On Fri, Oct 02, 2026 at 01:38:31PM +0200, Geert Uytterhoeven wrote:
> > 
> >> On Fri, 2 Oct 2026 at 10:10, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> > 
> >>> But fork() -> -EINVAL or -ENOSYS = nommu, then just have the child quit and
> >>> etc. should do it.
> >>
> >> fork() is not strictly an MMU-feature (you can implement fork on nommu
> >> if all memory accesses are done relative to a base address register),
> >> while I think mprotect() is an MMU-feature. Unless it can also be used
> >> to change the protection using the one or two BARs most MCU haves?
> >> Anything else that is a real MMU-feature? Non-identity mmap()?
> > 
> > Does any nommu arch implement fork() in linux?
> 
> I was about to say, that sounds a bit too theoretical for me. IIUC that is not
> implemented, and if someone would propose it we would likely just nak it.
> 
> In the unlikely event that this would see the light of day, we could always
> change our detection in the selftests.

thanks all for the inputs and review.

I will try to implement the detection with /proc/meminfo.

-- Hajime

