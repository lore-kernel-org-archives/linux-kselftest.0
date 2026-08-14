Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB61436605E
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 11:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786708769; cv=none; b=cci3pBlN9ohc6tBIKAELBiKwInZSqEBW5eXV12qrIuRXfrZltHoJCVPh2q5tRRU5sDERxektef6Zt6bAWrvBcdszt4aerIQxLo5k8cbWheBxskWjcMoluZNJcB9NG/oG7drj5qcalJ+nmAogHutZQa256X5vUJW8JzomInEujs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786708769; c=relaxed/simple;
	bh=RYP0629y1UfrdGy8khiYA87mAohVFtVz0e44j8IUx4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+RwFHR330bUMxtnwWPpcaqlPyfrB0pxseTxYUr8qWnSNNtg6I1QdNjWhq6h3eC60AbwOLZV2cJIsrLDSOsk/weiwvNqjtZm3vA3gt+QDi0T0LpaKNNCh3IxvGhELukcdFexn4NVepOovPPvuHcPnO6rU7YnbnSjEOvZfqet87Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISQvWDCo; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISQvWDCo"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4980dc26022so9905355e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 04:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786708766; x=1787313566; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fBKI+DNHxLxbcSUrG16h2hjhLq0zAz6vhoA1K7SDvjQ=;
        b=ISQvWDCopcZBxgzlavpJXGgb8lsUE6nedysj6dctfykXhK9dsRrTHPCcv09JC8yuus
         HzYU+3Z4mnSNxBTDe9svg7xN9mW4pHpIUiLGQ0shbmaH4EJwxoYDQhr1HGwtWmNUoNKr
         n71dQS6t4y79fCTkSJFZaVL4xV5v124e2NZtee9qL//r/I3HATPOdmGUe4PtN11wu6ap
         O40mgQbmUG7VK6h6vNpNaXtXFav4xFzUOCF9rkiKj5iVfB2Xm28dWbYJIji4vHhxzyKP
         E+JzKjEWgdTKufO9piZ33fEhKKbzk29O2ZCgxLJtuIx/PeVHuZb7SywYJPVPq7nH8wej
         dxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786708766; x=1787313566;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fBKI+DNHxLxbcSUrG16h2hjhLq0zAz6vhoA1K7SDvjQ=;
        b=ntW3kfEk0nR7gqG+RIUBv4tH+LivSW2fPwUf5TYysMn4reYojv58eyjdAEgsuWST6H
         8lm/pAKpLmVYtbW2PaQjevPLc0siyUOCTuoKZGrUqqHUnUqUiyR2vQ1eXjvwA6iSn4pM
         xSdwlSLOZeI5GS8qkMlevm3pPt6eV3aOudWKgwdyqeSyeytZAVRAqZWkx+14sqH7Z99A
         TnwNma47RC6Rwd956w5c5vLqM0/kjm2taeeoG4RPaVsygD3EgRX35gynemMOXgmjmhOU
         AlrmoW3Kn0Q+Ge5Ov3VaWgQQ6zp1VDUK8nAnCch8IvvWcuEbMOamStBZEje841CpX3eZ
         45tA==
X-Forwarded-Encrypted: i=1; AHgh+RoZ4KaBxAbJWtDD7lAm07jcQNl/DOZS5D9W6RipG+7iveS/482lMBxBBUi8bJrJ3XLk2WYNa0M677Lik/Z7MM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBcyPe7+FWOiwsLIZoE3B8e+49pilTIy3JeN8OqWu+8ntlYkJF
	sgSi3PiHwqishLqVQTPkJZ20+HrZROj15o8QkEbdOvvFDSec7vckxTja
X-Gm-Gg: AR+sD11ei0G1doGxKeG/f0e57FjR41SG4MsEaOPzNVz454CYJoA+5agrBwrs3EawRLh
	rAyLUq1YBsHcNi0BTpgOVuAumFAs8iGi00hJGo63IYEFUxfLDBXz7bQRRcALqosjbYyoa+etFRo
	oDwLEsz09VrtxORYdpaklM/5Ocu2HPQUGE4EzUNx4HXgBFk6CajSWbDK+0hFm40SkTpJm+Mi8tJ
	lOmsfM2a2BMSepx3VHRWDLtAtoD47/AgVDxGw3iGvzK35Mpc93iwJ/eQ5ckW7t4aRWiD+mqHue6
	E/1UPEMpdiZheSVuJN8MiuONc6WTcITU7hg3qGka2W393Z+6VG/fkBMZiXEgwGfte4cFwtq3yzl
	Nt+raGcraJ0bjNx8n9m22GNY/sYAk0NtmUU7T+EZNTIG3JH8NBT6/5ToRnkvXF33NrXVQW604fq
	hHnSywcuW4W6z2JEr1jmAl79XgF6gf0e5+sO7E/ig3HBBqeFB3KteyJEcDIO7kYhJjTyi9
X-Received: by 2002:a05:600c:810a:b0:495:737a:7afe with SMTP id 5b1f17b1804b1-49987985df1mr66486105e9.15.1786708765976;
        Fri, 14 Aug 2026 04:59:25 -0700 (PDT)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49989af26eesm24779265e9.15.2026.08.14.04.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 04:59:25 -0700 (PDT)
Date: Fri, 14 Aug 2026 12:09:49 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
Cc: bpf@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v3 2/2] selftests/bpf: Add cross-subprog gotox
 target coverage
Message-ID: <an8FjRFfjWlFa-Dy@mail.gmail.com>
References: <20260628-f01-03-gotox-bpf-next-v3-0-b744432e1361@mails.tsinghua.edu.cn>
 <20260628-f01-03-gotox-bpf-next-v3-2-b744432e1361@mails.tsinghua.edu.cn>
 <akQPsxoMVYx8+9Ap@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akQPsxoMVYx8+9Ap@mail.gmail.com>

On 26/06/30 06:49PM, Anton Protopopov wrote:
> On 26/06/28 09:59PM, Nuoqi Gui wrote:
> > Add a gotox regression test with two one-entry INSN_ARRAY maps. CFG can
> > model a map whose target stays in the main subprog, while the verified path
> > can load a different map whose target is the first instruction of another
> > subprog.
> > 
> > That second target is outside the subprog that contains this gotox
> > instruction, so program load must be rejected with -EINVAL.
> > 
> > Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
> > ---
> >  tools/testing/selftests/bpf/prog_tests/bpf_gotox.c | 73 ++++++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_gotox.c b/tools/testing/selftests/bpf/prog_tests/bpf_gotox.c
> > index 73dc63882b7d..997724c61c8b 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/bpf_gotox.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/bpf_gotox.c
> > @@ -255,6 +255,30 @@ static int create_jt_map(__u32 max_entries)
> >  			      key_size, value_size, max_entries, NULL);
> >  }
> >  
> > +static int create_jt_map_with_target(__u32 target)
> > +{
> > +	struct bpf_insn_array_value val = { .orig_off = target };
> > +	__u32 key = 0;
> > +	int map_fd;
> > +
> > +	map_fd = create_jt_map(1);
> > +	if (!ASSERT_GE(map_fd, 0, "create_jt_map"))
> > +		return -1;
> > +
> > +	if (!ASSERT_EQ(bpf_map_update_elem(map_fd, &key, &val, 0),
> > +		       0, "bpf_map_update_elem")) {
> > +		close(map_fd);
> > +		return -1;
> > +	}
> > +
> > +	if (!ASSERT_EQ(bpf_map_freeze(map_fd), 0, "bpf_map_freeze")) {
> > +		close(map_fd);
> > +		return -1;
> > +	}
> > +
> > +	return map_fd;
> > +}
> > +
> >  static int prog_load(struct bpf_insn *insns, __u32 insn_cnt)
> >  {
> >  	return bpf_prog_load(BPF_PROG_TYPE_RAW_TRACEPOINT, NULL, "GPL", insns, insn_cnt, NULL);
> > @@ -393,6 +417,52 @@ reject_offsets(struct bpf_insn *insns, __u32 insn_cnt, int off1, int off2, int o
> >  		close(prog_fd);
> >  }
> >  
> > +static void
> > +check_cross_subprog_gotox_target(void)
> > +{
> > +	struct bpf_insn insns[] = {
> > +		/* main subprog [0,14) */
> > +		BPF_MOV64_REG(BPF_REG_6, BPF_REG_1),
> > +		BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, BPF_PSEUDO_CALL, 0, 12),
> > +		BPF_LDX_MEM(BPF_W, BPF_REG_7, BPF_REG_6, 0),
> > +		BPF_JMP_IMM(BPF_JEQ, BPF_REG_7, 0, 4),
> > +		BPF_LD_IMM64_RAW(BPF_REG_2, BPF_PSEUDO_MAP_VALUE, 0),
> > +		BPF_LDX_MEM(BPF_DW, BPF_REG_2, BPF_REG_2, 0),
> > +		BPF_JMP_A(3),
> > +		BPF_LD_IMM64_RAW(BPF_REG_2, BPF_PSEUDO_MAP_VALUE, 0),
> > +		BPF_LDX_MEM(BPF_DW, BPF_REG_2, BPF_REG_2, 0),
> > +		BPF_RAW_INSN(BPF_JMP | BPF_JA | BPF_X, BPF_REG_2, 0, 0, 0),
> > +		BPF_MOV64_IMM(BPF_REG_0, 1),
> > +		BPF_EXIT_INSN(),
> > +
> > +		/* static subprog [14,16) */
> > +		BPF_MOV64_IMM(BPF_REG_0, 42),
> > +		BPF_EXIT_INSN(),
> > +	};
> > +	int good_fd, bad_fd, prog_fd;
> > +
> > +	good_fd = create_jt_map_with_target(12);
> > +	if (!ASSERT_GE(good_fd, 0, "create_good_jt_map"))
> > +		return;
> > +
> > +	bad_fd = create_jt_map_with_target(14);
> > +	if (!ASSERT_GE(bad_fd, 0, "create_bad_jt_map")) {
> > +		close(good_fd);
> > +		return;
> > +	}
> > +
> > +	insns[4].imm = bad_fd;
> > +	insns[8].imm = good_fd;
> > +
> > +	prog_fd = bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, NULL, "GPL",
> > +				insns, ARRAY_SIZE(insns), NULL);
> > +	if (!ASSERT_EQ(prog_fd, -EINVAL, "cross_subprog_gotox_prog_load"))
> > +		close(prog_fd);
> > +
> > +	close(bad_fd);
> > +	close(good_fd);
> > +}
> > +
> >  /*
> >   * Verify a bit more complex programs which include indirect jumps
> >   * and with jump tables loaded with a non-zero offset
> > @@ -541,5 +611,8 @@ void test_bpf_gotox(void)
> >  	if (test__start_subtest("check-ldimm64-off-gotox-llvm"))
> >  		__subtest(skel, check_ldimm64_off_gotox_llvm);
> >  
> > +	if (test__start_subtest("check-cross-subprog-gotox-target"))
> > +		check_cross_subprog_gotox_target();
> > +
> >  	bpf_gotox__destroy(skel);
> >  }
> 
> LGTM now. Please add another selftests as was mentioned in the main patch.
> 
> Also, v3 lost the ack from Yonghong Song for this patch.

Hi Nuoqi! Are you planning to follow up on this series?

> > -- 
> > 2.34.1
> > 
