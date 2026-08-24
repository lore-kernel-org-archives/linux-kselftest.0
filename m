Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E907D2D47E9
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 18:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787596098; cv=none; b=Y+JdzJ3DU8pW4RYH8Q541IP/R/ehT7cQouDukOelHtlixtg6gwci2/7Oc/9TtsFBOoR2SpUAz5VfdcQWXVzsRT3ulkXjOUkRssJPSrbV2Om20Tu3Z0YMQppE2R+lGT6U9mYeCUGAnQf0pRH0Yo1Exj/9lNXUa/SgYVlPeLlOaXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787596098; c=relaxed/simple;
	bh=sArzGq28OOdv8i69ffUheyMCMZAKRWDM1PxA3qsrTvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7N12XrFx9mc1Z/aBOb75+x4Z2lIw3GuTphBlRRcklSFfo3WwSZa0vDPhBvQ2pxZrTVUW51PX008Q+A6pqs891IW0fS9OTFV1rk8AAGyocah9pa/GZi9EXiougPK+lofI2kSxX0Alf4lg2Suc7OOJm6HeB2HLE1gm0JoK4d8Yxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eIfZ9DzM; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eIfZ9DzM"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1712a04ddaso648333466b.2
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 11:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787596095; x=1788200895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZN3Ng6p9SXt1oKNs5dwXCjUrX1QRpZaWGcnMmIYNtmQ=;
        b=eIfZ9DzMWeWz27M8LymNScmEAJD5pUsTem5BgboS1DQZvVIuM9nH7+IX8mvh/qBo52
         upEv2JU2eJUPMs1ydmnjHJNGubiaUh70lH9QodevPSqtiXeSGn1hYDIID0ylSBTzd0gG
         hFoKkdr57NvJ1wDe8pQlAiyzhMHgUBpkCeywuiA8xco+poUy0MMfRv3OeMRuUERrObIv
         E3f1DYRpJBERCB1QaMHnMIqFK9U901HKC89SXPu8AR4p+CcxEsWlYT19eicZPbaNg5kE
         n+XIE+4bvKmM0mBSvSMFU/aITs9oiV41b4TI/nV7btB+cHdOwJI33ASZPWknWbBGx4Yi
         EsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787596095; x=1788200895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZN3Ng6p9SXt1oKNs5dwXCjUrX1QRpZaWGcnMmIYNtmQ=;
        b=AtPwvxx3GkR6OvhXLhJAR8LpWEcVoXbwLW1HO3/o4NZW5dPoe41nB9oRPPwbW7Qb3q
         Nm9Ut7Al6UJ4lhzAsza94IQIKwg6SulRssL2FklxcGHRKwJmjs8H862kpzjdbIGvRa6l
         HrQIYcTrRueFrG1DjjvtPNQfgQoJCXxRM69oWr9utTMDtgHXVRdmW2o5wHFhUJKNCHCX
         kPBA0HQmSnNo8hqbVLTzK6aXkHzdqLK6qpFJWAXsxm0FE9S1dinSfTTcU5fBEbvAYcdz
         93V9ldEbJp47dt8XYolpT3OM7XZrJEd83S3CxiZTEzydlqrqoodBd37TMkJHdtAiEVmt
         W2OQ==
X-Forwarded-Encrypted: i=1; AHgh+RplW2QuNMbLHsUJRztTctHNgpDFEfbga5XG3Xe6fcKy2Y2MaA3LdbIpk3BfJUBcpA9d+HlzeBRcfklzl3Xj8/I=@vger.kernel.org
X-Gm-Message-State: AFuF++kcvjYzoYSQDj+r+qpu78/2VjqzAYgZ7LlgwrR2X06Zki2/Jb/q
	5JKeYwo6mvMY7YLWkR92yF1zMUk5g9ZBqlqS+aky97Y21nfIngqyFEStVrLg2Rbxrys=
X-Gm-Gg: AR+sD13klh8YE/7sp9hf2VzGFXn9+1UPJybO1IbrQM+xAnooshjusvb2mo8OO1Or2xN
	ysnB+m5B+M8tTjWP8v+mUkcqexinm0za2oDcmEp0/lRpgOMRAGBnXvkD5GQ86fSw/2+mfOaRKYk
	8z3jYGXI0fj26/2LlIjL1Ivx/+clejWa1i35NIL0O1gLcQVa6PwhEwKgEbjfGkXC/qjIxAqJKXG
	PtPJj241CBQbC6YTkAgdF2lPCd6HkuYY8hX9GdIdqvTMvSblZf9w4dYhbb9sZrkK61qrDT6Xb7t
	+iFTDa5wDn5zfgZn6UxxIZpjaZbvV7zrkdgMsLJ6Njk/a4j15hKk3Zc3dazo848ztrLlHGsnDIE
	DRRVy8cJFObFl4WA4Ney2pT2scSJmlgDDV6f5QX+JNVQtXF82EaP0yP1IdcZeH1SKJTpitpIk8/
	66dLgRGNiHj1KJ8geu4ckx+GrZHdlv44KkpLMpQVhZnvrm31mtY611Bw9yq8oaOR9S6mW+L4Fen
	Q==
X-Received: by 2002:a17:907:72c4:b0:c24:4128:c19f with SMTP id a640c23a62f3a-c2491e838dcmr2458199966b.11.1787596095175;
        Mon, 24 Aug 2026 11:28:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496295627sm1330306766b.15.2026.08.24.11.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:28:14 -0700 (PDT)
Date: Mon, 24 Aug 2026 20:28:13 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 2/4] selftests: cgroup: Add dmem selftest coverage
Message-ID: <aox7nCE6ety6s8iL@localhost.localdomain>
References: <20260706-kunit_cgroups-v5-0-6c42c8753468@redhat.com>
 <20260706-kunit_cgroups-v5-2-6c42c8753468@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uio3lm5uor77nxwd"
Content-Disposition: inline
In-Reply-To: <20260706-kunit_cgroups-v5-2-6c42c8753468@redhat.com>


--uio3lm5uor77nxwd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/4] selftests: cgroup: Add dmem selftest coverage
MIME-Version: 1.0

On Mon, Jul 06, 2026 at 02:06:41PM +0200, Albert Esteve <aesteve@redhat.com=
> wrote:
> +static long long dmem_read_limit_for_region(const char *cgroup, const ch=
ar *ctrl,
> +					    const char *region_name)

This should be replaceable with lib/cgroup_util.c:cg_read_key_long()

> +{
> +	char buf[4096];
> +	char *line, *saveptr =3D NULL;
> +	char fname[256];
> +	char fval[64];
> +
> +	if (cg_read(cgroup, ctrl, buf, sizeof(buf)) < 0)
> +		return -2;
> +
> +	for (line =3D strtok_r(buf, "\n", &saveptr); line;
> +	     line =3D strtok_r(NULL, "\n", &saveptr)) {
> +		if (!line[0])
> +			continue;
> +		if (sscanf(line, "%255s %63s", fname, fval) !=3D 2)
> +			continue;
> +		if (strcmp(fname, region_name))
> +			continue;
> +		if (!strcmp(fval, "max"))
> +			return -1;
> +		return strtoll(fval, NULL, 0);
> +	}
> +	return -2;
> +}
> +
> +static long long dmem_read_limit(const char *cgroup, const char *ctrl)
> +{
> +	return dmem_read_limit_for_region(cgroup, ctrl, DM_SELFTEST_REGION);
> +}
> +
> +static int dmem_write_limit(const char *cgroup, const char *ctrl,
> +			    const char *val)
> +{
> +	char wr[512];
> +
> +	snprintf(wr, sizeof(wr), "%s %s", DM_SELFTEST_REGION, val);
> +	return cg_write(cgroup, ctrl, wr);
> +}
> +
> +static int dmem_selftest_charge_bytes(unsigned long long bytes)
> +{
> +	char wr[32];
> +
> +	snprintf(wr, sizeof(wr), "%llu", bytes);
> +	return write_text(DM_SELFTEST_CHARGE, wr, strlen(wr));
> +}
> +
> +static int dmem_selftest_uncharge(void)
> +{
> +	return write_text(DM_SELFTEST_UNCHARGE, "\n", 1);
> +}
> +
> +/*
> + * First, this test creates the following hierarchy:
> + * A
> + * A/B     dmem.max=3D1M
> + * A/B/C   dmem.max=3D75K
> + * A/B/D   dmem.max=3D25K
> + * A/B/E   dmem.max=3D8K
> + * A/B/F   dmem.max=3D0
> + *
> + * Then for each leaf cgroup it tries to charge above dmem.max
> + * and expects the charge request to fail and dmem.current to
> + * remain unchanged.
> + *
> + * For leaves with non-zero dmem.max, it additionally charges a
> + * smaller amount and verifies accounting grows within one PAGE_SIZE
> + * rounding bound, then uncharges and verifies dmem.current returns
> + * to the previous value.
> + *
> + */
> +static int test_dmem_max(const char *root)
> +{
> +	static const char * const leaf_max[] =3D { "75K", "25K", "8K", "0" };
> +	static const unsigned long long fail_sz[] =3D {
> +		(75ULL * 1024ULL) + 1ULL,
> +		(25ULL * 1024ULL) + 1ULL,
> +		(8ULL * 1024ULL) + 1ULL,
> +		1ULL
> +	};
> +	static const unsigned long long pass_sz[] =3D {
> +		4096ULL, 4096ULL, 4096ULL, 0ULL
> +	};

Possibly those could be signed (to save the casts down below).

> +	char *parent[2] =3D {NULL};
> +	char *children[4] =3D {NULL};
> +	unsigned long long cap;
> +	long long page_size;
> +	long long cur_before, cur_after;

Just `long` should be fine (with gcc).

> +	int ret =3D KSFT_FAIL;
> +	int charged =3D 0;
> +	int in_child =3D 0;
> +	long long v;
> +	int i;
> +
> +	if (access(DM_SELFTEST_CHARGE, W_OK) !=3D 0)
> +		return KSFT_SKIP;
> +
> +	if (find_selftest_region(root, &cap) !=3D 1)
> +		return KSFT_SKIP;
> +
> +	page_size =3D sysconf(_SC_PAGESIZE);
> +	if (page_size <=3D 0)
> +		goto cleanup;
> +
> +	parent[0] =3D cg_name(root, "dmem_prot_0");
> +	if (!parent[0])
> +		goto cleanup;
> +
> +	parent[1] =3D cg_name(parent[0], "dmem_prot_1");
> +	if (!parent[1])
> +		goto cleanup;
> +
> +	if (cg_create(parent[0]))
> +		goto cleanup;
> +
> +	if (cg_write(parent[0], "cgroup.subtree_control", "+dmem"))
> +		goto cleanup;
> +
> +	if (cg_create(parent[1]))
> +		goto cleanup;
> +
> +	if (cg_write(parent[1], "cgroup.subtree_control", "+dmem"))
> +		goto cleanup;
> +
> +	for (i =3D 0; i < 4; i++) {

	for (i =3D 0; i < ARRAY_SIZE(children); i++) {

> +		children[i] =3D cg_name_indexed(parent[1], "dmem_child", i);
> +		if (!children[i])
> +			goto cleanup;
> +		if (cg_create(children[i]))
> +			goto cleanup;
> +	}
> +
> +	if (dmem_write_limit(parent[1], "dmem.max", "1M"))
> +		goto cleanup;
> +	for (i =3D 0; i < 4; i++)

	for (i =3D 0; i < ARRAY_SIZE(children); i++) {

> +		if (dmem_write_limit(children[i], "dmem.max", leaf_max[i]))
> +			goto cleanup;
> +
> +	v =3D dmem_read_limit(parent[1], "dmem.max");
> +	if (v !=3D 1024LL * 1024LL)

This...

> +		goto cleanup;
> +	v =3D dmem_read_limit(children[0], "dmem.max");
> +	if (v !=3D 75LL * 1024LL)

=2E..and these literals would be nicer with MB() macro and possibly added
similar KB() macro.

> +		goto cleanup;
> +	v =3D dmem_read_limit(children[1], "dmem.max");
> +	if (v !=3D 25LL * 1024LL)
> +		goto cleanup;
> +	v =3D dmem_read_limit(children[2], "dmem.max");
> +	if (v !=3D 8LL * 1024LL)
> +		goto cleanup;
> +	v =3D dmem_read_limit(children[3], "dmem.max");
> +	if (v !=3D 0)
> +		goto cleanup;
> +
> +	for (i =3D 0; i < 4; i++) {

	for (i =3D 0; i < ARRAY_SIZE(children); i++) {

(to avoid unnamed non-trivial constant)

> +		if (cg_enter_current(children[i]))
> +			goto cleanup;
> +		in_child =3D 1;
> +
> +		cur_before =3D dmem_read_limit(children[i], "dmem.current");
> +		if (cur_before < 0)
> +			goto cleanup;
> +
> +		if (dmem_selftest_charge_bytes(fail_sz[i]) >=3D 0) {
> +			charged =3D 1;
> +			goto cleanup;
> +		}
> +
> +		cur_after =3D dmem_read_limit(children[i], "dmem.current");
> +		if (cur_after !=3D cur_before)
> +			goto cleanup;
> +
> +		if (pass_sz[i] > 0) {
> +			if (dmem_selftest_charge_bytes(pass_sz[i]) < 0)
> +				goto cleanup;
> +			charged =3D 1;
> +
> +			cur_after =3D dmem_read_limit(children[i], "dmem.current");
> +			if (cur_after < cur_before + (long long)pass_sz[i])
> +				goto cleanup;
> +			if (cur_after > cur_before + (long long)pass_sz[i] + page_size)
> +				goto cleanup;
> +
> +			if (dmem_selftest_uncharge() < 0)
> +				goto cleanup;
> +			charged =3D 0;
> +
> +			cur_after =3D dmem_read_limit(children[i], "dmem.current");
> +			if (cur_after !=3D cur_before)
> +				goto cleanup;
> +		}
> +
> +		if (cg_enter_current(root))
> +			goto cleanup;
> +		in_child =3D 0;
> +	}
> +
> +	ret =3D KSFT_PASS;
> +
> +cleanup:
> +	if (charged)
> +		dmem_selftest_uncharge();
> +	if (in_child)
> +		cg_enter_current(root);
> +	for (i =3D 3; i >=3D 0; i--) {

ditto with ARRAY_SIZE

> +		if (!children[i])
> +			continue;
> +		cg_destroy(children[i]);
> +		free(children[i]);
> +	}
> +	for (i =3D 1; i >=3D 0; i--) {

ditto with ARRAY_SIZE

> +		if (!parent[i])
> +			continue;
> +		cg_destroy(parent[i]);
> +		free(parent[i]);
> +	}
> +	return ret;
> +}
> +
> +/*
> + * This test sets dmem.min and dmem.low on a child cgroup, then charge
> + * from that context and verify dmem.current tracks the charged bytes
> + * (within one page rounding).

I don't know, this doesn't test much of the .min nor .low protection,
and the .current tracking is already tested by the above. I'd drop it
for now.

> + */
> +static int test_dmem_charge_with_attr(const char *root, bool min)
> +{
> +	unsigned long long cap;
> +	const unsigned long long charge_sz =3D 12345ULL;
> +	const char *attribute =3D min ? "dmem.min" : "dmem.low";
> +	int ret =3D KSFT_FAIL;
> +	char *cg =3D NULL;
> +	long long cur;
> +	long long page_size;
> +	int charged =3D 0;
> +	int in_child =3D 0;
> +
> +	if (access(DM_SELFTEST_CHARGE, W_OK) !=3D 0)
> +		return KSFT_SKIP;
> +
> +	if (find_selftest_region(root, &cap) !=3D 1)
> +		return KSFT_SKIP;
> +
> +	page_size =3D sysconf(_SC_PAGESIZE);
> +	if (page_size <=3D 0)
> +		goto cleanup;
> +
> +	cg =3D cg_name(root, "test_dmem_attr");
> +	if (!cg)
> +		goto cleanup;
> +
> +	if (cg_create(cg))
> +		goto cleanup;
> +
> +	if (cg_enter_current(cg))
> +		goto cleanup;
> +	in_child =3D 1;
> +
> +	if (dmem_write_limit(cg, attribute, "16K"))
> +		goto cleanup;
> +
> +	if (dmem_selftest_charge_bytes(charge_sz) < 0)
> +		goto cleanup;
> +	charged =3D 1;
> +
> +	cur =3D dmem_read_limit(cg, "dmem.current");
> +	if (cur < (long long)charge_sz)
> +		goto cleanup;
> +	if (cur > (long long)charge_sz + page_size)
> +		goto cleanup;
> +
> +	if (dmem_selftest_uncharge() < 0)
> +		goto cleanup;
> +	charged =3D 0;
> +
> +	cur =3D dmem_read_limit(cg, "dmem.current");
> +	if (cur !=3D 0)
> +		goto cleanup;
> +
> +	ret =3D KSFT_PASS;
> +
> +cleanup:
> +	if (charged)
> +		dmem_selftest_uncharge();
> +	if (in_child)
> +		cg_enter_current(root);
> +	cg_destroy(cg);
> +	free(cg);
> +	return ret;
> +}
> +
> +static int test_dmem_min(const char *root)
> +{
> +	return test_dmem_charge_with_attr(root, true);
> +}
> +
> +static int test_dmem_low(const char *root)
> +{
> +	return test_dmem_charge_with_attr(root, false);
> +}
> +
> +/*
> + * This test charges non-page-aligned byte sizes and verify dmem.current
> + * stays consistent: it must account at least the requested bytes and
> + * never exceed one kernel page of rounding overhead. Then uncharge must
> + * return usage to 0.

The lower bound makes sense. Could you explain more about the upper
bound and granularity? That applies only for the test module or is that
intended constraint for any dmem-charging driver?

> + */
> +static int test_dmem_charge_byte_granularity(const char *root)
> +{
> +	static const unsigned long long sizes[] =3D { 1ULL, 4095ULL, 4097ULL, 1=
2345ULL };
> +	char *cg =3D NULL;
> +	unsigned long long cap;
> +	long long cur;
> +	long long page_size;
> +	int ret =3D KSFT_FAIL;
> +	int charged =3D 0;
> +	int in_child =3D 0;
> +	size_t i;
> +
> +	if (access(DM_SELFTEST_CHARGE, W_OK) !=3D 0)
> +		return KSFT_SKIP;
> +
> +	if (find_selftest_region(root, &cap) !=3D 1)
> +		return KSFT_SKIP;
> +
> +	page_size =3D sysconf(_SC_PAGESIZE);
> +	if (page_size <=3D 0)
> +		goto cleanup;
> +
> +	cg =3D cg_name(root, "dmem_dbg_byte_gran");
> +	if (!cg)
> +		goto cleanup;
> +
> +	if (cg_create(cg))
> +		goto cleanup;
> +
> +	if (dmem_write_limit(cg, "dmem.max", "8M"))
> +		goto cleanup;
> +
> +	if (cg_enter_current(cg))
> +		goto cleanup;
> +	in_child =3D 1;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(sizes); i++) {
> +		if (dmem_selftest_charge_bytes(sizes[i]) < 0)
> +			goto cleanup;
> +		charged =3D 1;
> +
> +		cur =3D dmem_read_limit(cg, "dmem.current");
> +		if (cur < (long long)sizes[i])
> +			goto cleanup;
> +		if (cur > (long long)sizes[i] + page_size)
> +			goto cleanup;
> +
> +		if (dmem_selftest_uncharge() < 0)
> +			goto cleanup;
> +		charged =3D 0;
> +
> +		cur =3D dmem_read_limit(cg, "dmem.current");
> +		if (cur !=3D 0)
> +			goto cleanup;
> +	}
> +
> +	ret =3D KSFT_PASS;
> +
> +cleanup:
> +	if (charged)
> +		dmem_selftest_uncharge();
> +	if (in_child)
> +		cg_enter_current(root);
> +	if (cg) {
> +		cg_destroy(cg);
> +		free(cg);
> +	}
> +	return ret;
> +}
> +
> +#define T(x) { x, #x }
> +struct dmem_test {
> +	int (*fn)(const char *root);
> +	const char *name;
> +} tests[] =3D {
> +	T(test_dmem_max),
> +	T(test_dmem_min),
> +	T(test_dmem_low),
> +	T(test_dmem_charge_byte_granularity),
> +};
> +#undef T
> +
> +int main(int argc, char **argv)
> +{
> +	char root[PATH_MAX];
> +	int i;
> +
> +	ksft_print_header();
> +	ksft_set_plan(ARRAY_SIZE(tests));
> +
> +	if (cg_find_unified_root(root, sizeof(root), NULL))
> +		ksft_exit_skip("cgroup v2 isn't mounted\n");
> +
> +	if (cg_read_strstr(root, "cgroup.controllers", "dmem"))
> +		ksft_exit_skip("dmem controller isn't available (CONFIG_CGROUP_DMEM?)\=
n");
> +
> +	if (cg_read_strstr(root, "cgroup.subtree_control", "dmem"))
> +		if (cg_write(root, "cgroup.subtree_control", "+dmem"))
> +			ksft_exit_skip("Failed to enable dmem controller\n");
> +
> +	for (i =3D 0; i < ARRAY_SIZE(tests); i++) {
> +		switch (tests[i].fn(root)) {
> +		case KSFT_PASS:
> +			ksft_test_result_pass("%s\n", tests[i].name);
> +			break;
> +		case KSFT_SKIP:
> +			ksft_test_result_skip(
> +				"%s (need CONFIG_DMEM_SELFTEST, modprobe dmem_selftest)\n",
> +				tests[i].name);

I'm worried that the KSFT_SKIP from a subtest might be too broad for the
modprobe prompt.
Perhaps you can check it by stat'ing DM_SELFTEST_CHARGE before any
subtests start?


> +			break;
> +		default:
> +			ksft_test_result_fail("%s\n", tests[i].name);
> +			break;
> +		}
> +	}
> +
> +	ksft_finished();
> +}
>=20
> --=20
> 2.54.0
>=20

--uio3lm5uor77nxwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaoyNOBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Agl7gD+Ig0HAvjjUHfB/jViwGA2
lCIzrsqG9gBaWOZahR86S+QBAIo02Sv7ah0Wy3zLdPteQXjCKHlW1EgbGis03hbu
1N0E
=gGtY
-----END PGP SIGNATURE-----

--uio3lm5uor77nxwd--
