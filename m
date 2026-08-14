Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602E82FD7D3
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 22:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786746932; cv=none; b=PbHpNWPBNw7UyVX2fuHCb3L7gwOo38yRAvhkrKFbJ3bckmOJyPrAT0M2hV7MNJCgKaFFCDnVGSXt/4Ek0HSfXxOLHUrSx07k8gyREVK8gxHHQCRTXiUEjEuz72GXypCTAaL9I9s7aThlso6Q7XxzdChTGqdc2q8/xq8Tr2HLSQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786746932; c=relaxed/simple;
	bh=attlDMMQNBlrUCdYxA40vOImhMdJaWIkrWk8xlVfV90=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cvso95bP4yfV+PkPVYtEJm71hpQd0WNGGEQq3Q0xkYZu5d3mfAOWLjgfRzECSB0gk1Mtg5P7lrSnWkide0h2c6SVPJx9Qvt3JL55hwRtoUy6ba9MNFCDxB3TNXofxcjpGJ111tH8FMX+8hWm2ND1Q3k9ciaB4eSQD0CLSP4dcwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nITXmdqr; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nITXmdqr"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1390468a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 15:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786746931; x=1787351731; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n2EAblvWDRelmfnXh27a45O70JHPB4giXZ+AN2NzhtQ=;
        b=nITXmdqrYLhqo7KeeAY2VqzIZGFcUwbtuWpUgyaiIFRvOM8AZTOEkbUt6PToidhQ9o
         Vaa5lvf8kqtq9KuxLozLbsGAB9sv5lE896j5wKKUvt24K0Kl8dxch23FAbprMnejibMG
         ENf/gpZf3bwfyjyryGjRaYCMPAXsBGnWE/pAOtcYLRlZiXMrZmYRxvCF8tVku49e4mqn
         u3ivRSgRltzRoXBwfoba3Cgfg6sRpxqFlA8DK1fRHx+i5mecHn/pBAYSyivh8bbKCsfm
         e26Wdn6K8tBIIPr502Gf6cBjUDcIKjvnhX5UBJLUfYnHstxwz/9qWVicl5Qp2RVuAw7B
         LCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786746931; x=1787351731;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n2EAblvWDRelmfnXh27a45O70JHPB4giXZ+AN2NzhtQ=;
        b=ENChbGY0uqEctA7z0HKbCxXCE9/V0e2jFpSPmeubqRgvGPlBRghYqnJqv/0/cJB8kE
         fuROp4mc4AcCpqt4nnVfawKe3rs/mlhOczhDJcHmENF2dakO4XZ+Fg1Fhr32xdN4WsCG
         8FNmBSLMPzD1agD/HRnxe8pDHkCGFpu+NJ49w0RhTURVj7ghb41fwi5YrR1VGxKXTwZt
         rtVb6yLCh7pxYEzYU/7XvhN2k426QF2TUm20XleszqMw6LHK57vBtDjDJcixt0pDK64h
         yjZerSer8mSiWQ+vEb9jnTX360WARd17ZkS9zwL/wNEATJczWp2Vw69SBXAaKhxYXRB+
         ouHw==
X-Forwarded-Encrypted: i=1; AHgh+Roxk7m7HlAQeChgERjgofi9tC5Wu3Uzdi2T9QmxwIUq2jyRYbPRZzX92i+9CKU3jmSF33Wo9GRxKhH/uP33LCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOqAbPqy5viXeXtFMpi6YkraGPbGnPZN3hrk2/nIZq8V9VLz5T
	29OaAis4BraSWx5E6yrdGJlCJPToaDWKMcDm8wu/RSXie5uw19n55gGB
X-Gm-Gg: AR+sD12uY/bAWBRvAIDCYfPmC8sIBQNdh2pdxJ89XJfkEN99bvxIFjOyYrQ0zweEdZc
	A+mjsWj3KzEPljXO49De2AbwdNEfrmgc9jZQOy8p/EhkeHkwPB4Pin5xHpwmNFxN5zvY9X5p1CQ
	aH6stLdt+oSgy2Nm+Bbr4m01hSYsRXKez6ujlTq6lyPKXkg29WS69Zj1R28dCwuRpQLvB/tekvc
	RNYQqTthID7L5ke8+A8LpHRNBbtBzR4QOrPpsgMYH/p7DZm73Pw1ieOIBcGu5/1kplQlTjqnsvm
	gS7ETUUlEfsqvEPfopfqM8P136kKyVJNCxbaX+DAZ8h7wTVOnD4TFvE77wQRTOMTLZTMkwXGLPa
	viFtWAFppmZeLLDVLW1/OoBcXE7SYPUifNNXhg096aEY+LxarslvB1YJFQsOGm1ngfdENP5VPXn
	C03/DzdBPWMgCgN0+jIik9dfl//SpKJItt7pxskIOKc9Q9mKlC437yaxbjivJoqTvEPaPEAdyag
	GqqXih5ANXHYVLARmmKlKe/ER6ECA6R1m83Wyd3K0PCVXbzh8wAlA7t9aQiqHhQT6wVfoMcTvo8
	eNdr8A==
X-Received: by 2002:a17:90b:3c91:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-3933b78e3c2mr11247940a91.7.1786746930611;
        Fri, 14 Aug 2026 15:35:30 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933b699e47sm2074781a91.4.2026.08.14.15.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:35:29 -0700 (PDT)
Date: Sat, 15 Aug 2026 07:35:26 +0900
Message-ID: <m2wltspbyp.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: ljs@kernel.org
Cc: linux-mm@kvack.org,
	geert@linux-m68k.org,
	daniel@thingy.jp,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: Re: [RFC PATCH 6/6] selftests/mm: add nommu mmap and mremap behavior tests
In-Reply-To: <an8SvW3jv3JuAFc8@lucifer>
References: <20260813063401.1786548-1-thehajime@gmail.com>
	<20260813063401.1786548-7-thehajime@gmail.com>
	<an8SvW3jv3JuAFc8@lucifer>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


On Fri, 14 Aug 2026 22:28:53 +0900,
Lorenzo Stoakes (ARM) wrote:
> 
> On Thu, Aug 13, 2026 at 03:34:01PM +0900, Hajime Tazaki wrote:
> > Introduce a kselftest utility to validate memory mapping capabilities
> > under nommu kernels, aligned with
> > Documentation/admin-guide/mm/nommu-mmap.rst.
> >
> > The test implements basic checks into a generic architecture-agnostic
> > test matrix applicable across nommu targets. It evaluates:
> >
> > 1. MAP_FIXED allocation rejections.
> > 2. Standard MAP_PRIVATE and MAP_ANONYMOUS allocation resilience.
> > 3. MAP_UNINITIALIZED allocations via optional kernel configurations.
> > 4. Regular file mappings via standard filesystem storage.
> > 5. Memory-backed file mapping with /dev/zero
> > 6. Block device subsystem mappings (gracefully skipping if node is
> >    missing).
> > 7. Shared vs Private backing discrepancies under nommu conditions.
> > 8. mremap limits, ensuring non-expandable restrictions behave properly.
> 
> Thanks for adding these.
> 
> It's horrible to not have the kselftest harness for these, but as established,
> fork() doesn't work for nommu (!)
> 
> A lot of these tests seem to relate to functionality I'm not really happy with
> in the rest of the series so let's see how things pan out with the series
> overall I guess!

(snip)

> > diff --git a/tools/testing/selftests/mm/nommu_mremap_test.c b/tools/testing/selftests/mm/nommu_mremap_test.c
> > new file mode 100644
> > index 000000000000..b1b8a4e64b55
> > --- /dev/null
> > +++ b/tools/testing/selftests/mm/nommu_mremap_test.c
> > @@ -0,0 +1,583 @@
(snip)
> > +
> > +static int get_shared_writable_file_expected_error(const char *path)
> > +{
> > +	if (get_fs_type(path) == RAMFS_MAGIC)
> > +		return EPERM; /* ramfs failed */
> > +
> > +	return 0;
> > +}
> > +
> > +static int pre_conf_trim_page(void)
> > +{
> > +	return set_nr_trim_pages("0\n");
> > +}
> > +
> > +static int post_conf_trim_page(int value)
> > +{
> > +	char buf[32];
> > +
> > +	if (snprintf(buf, sizeof(buf), "%d\n", value) < 0)
> > +		return -EIO;
> > +
> > +	return set_nr_trim_pages(buf);
> > +}
> > +
> > +struct mremap_case_t {
> > +	const char *name;
> > +	const char *pathname;
> > +	int open_flags;
> > +	int mmap_prot;
> > +	int mmap_flags;
> > +	int exp_err;
> > +	int (*resolve_exp_err)(const char *path);
> > +	unsigned int old_pages;
> > +	unsigned int new_pages;
> > +	int (*pre_hook)(void);
> > +	int (*post_hook)(int value);
> > +};
> > +
> > +static struct mremap_case_t mremap_cases[] = {
> > +	{
> > +		.name = "anonymous shrink (r--)",
> > +		.pathname = NULL,
> > +		.open_flags = O_CREAT | O_RDWR | O_EXCL,
> > +		.mmap_prot = PROT_READ,
> > +		.mmap_flags = MAP_ANONYMOUS | MAP_PRIVATE,
> > +		.exp_err = 0,
> > +		.resolve_exp_err = 0,
> > +	},
> > +	{
> > +		.name = "shared file shrink (r--)",
> > +		.pathname = "/tmp/ksft.nommu-remap-XXXXXX",
> > +		.open_flags = O_CREAT | O_RDWR | O_EXCL,
> > +		.mmap_prot = PROT_READ,
> > +		.mmap_flags = MAP_SHARED,
> > +		.exp_err = 0,
> > +#ifdef CONFIG_NOMMU
> > +		.resolve_exp_err = get_shared_writable_file_expected_error,
> > +#else
> 
> Hmm aren't these all nommu tests anyway?

those tests are indeed for nommu but also compare with mmu systems.
actually I was trying to implement test behaviors which are described
in Documentation/admin-guide/mm/nommu-mmap.rst.

this particular case ("shared file shrink (r--)") is not described in
the doc, but test with a conditional error on nommu, and expects
success on mmu kernel, which is interesting (at least for nommu folks)
to validate future regressions.

I think now if I split into several series of this patchset, I would
drop this particular chunk which is needed for other series, and keep
only basic tests for nommu kernel which is described in the doc.

-- Hajime
