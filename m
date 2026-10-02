Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AF43B47DC
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 13:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947518; cv=none; b=rW0q/SC/yLbJoVrVE5s4IXUywDsy1RsLKhnURIfeP2zQxUe6zO/kr0msWYDGqe864KgcRNzzSevzQW84kNyqbqYLvwYSv9dgZpGgQnTrxm6aMsuJt4GnaC3YnW8cynQA2fERJoHdy84utRDdDaCkmri0LTaJrpKIKQcP+9KwBxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947518; c=relaxed/simple;
	bh=CeUTDK8UskaWLRe6cd8YaVvVkaHfr4p4lFdGwAMcwUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GEkLN4qIBDufWAPbMvQ8qg0gRirvqAGG2DTZxuRRaTVlSRcBzJWe6rsxAw++5NU7uLqFnYT6va8SUNuKWicQ8k1B5yOParEQmG0iPd2HYkO8zKFyhhdSXzZ6R6uals18liYok7iOJiCL+0nKRYie/junnITs6VKvrMmbc7GkGc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HR6AjEEr; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HR6AjEEr"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b3e517e6dso2110489eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 06:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947516; x=1791552316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7RY0E+uq3VziEyUgNcdccbA0uSJfCvboTGuc7W3OBnE=;
        b=HR6AjEErz2PiL7y4spse2vxZcFFHstr7SbrVIzyT/OwIUHbV7yl0K9BMdhxKMpB8ru
         WKMSI0j2u5lNC7cgARWjtOnzsUrLqo2bHbQkfTzkQrz7UD9c4s0/qxkzwOorW41I3rX4
         EYwpfGco0Xux6FyiSzv/LeAvTgSXDqIMQmeRBVDjsvSaKE4hsNCZ/A2y6OWt0xWkSFUF
         H7mGyexvKrkAM6mHSBemQbhcSyteBu+TiQsKa03S56cGJVMa963sPJGKe1sp9t/sf9O7
         Cr/n7E9SVnG9xpgxmv2uV5KjiO8PDgQastD5MDybiPLLr7w0ZFZEBaiLYGY9InnMzAri
         ZjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947516; x=1791552316;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7RY0E+uq3VziEyUgNcdccbA0uSJfCvboTGuc7W3OBnE=;
        b=yfhNQfl/ThGM+4Nvx3dglKUXPLhWIU8jHAF2hvA9uXxGwtex8IwgoZUppZpfs+mSMB
         iHnqI2WPmLsLDXgqwvgsNSUeh0dGY2Q/dnu5nJNpmVBMr0kvgsTK2bhMFV+hZeHZePtN
         AMA266UgwFawbQMt5Oc6QLtfQBoGEt2J4kCpr0QMfUpgoAOAttQkFQiwbZrXgIZnaKyK
         qZTbtAtphDNR01coziaqeT+tuWt6ncz/6lJ6EYGnYUsJyDbTq8nrlawwp2hnIoaXOUgn
         wWg6D6+06uO2CYs44jtisKAVvMkuA/koXveRDpd8KjQOAtVdRAG3sbEmPG5Avsa2t4zJ
         tqlg==
X-Forwarded-Encrypted: i=1; AKwUvBxOJN5sPG6zUqaH1UoCdEl+fpmmrpNCr8MSY9LJBW/q8Hqdn0/Sn4WGVPQQ1LOvNfAuA/UiiUfU2MWNzScu2Io=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdj8pVR7dkWEBdmaoPo6hEMWVsiAxplv+mz+4giknbvVMAxWtc
	jGk4O/rzXcRORRXktD1mLq4ifHbacSB36grHz/8Qu9Yef4G8GeWbdOM2
X-Gm-Gg: AYBFou0LhZhxuQkAQlisW12DHa9mvijCKI/SoMt1yFL/gaYdOjKpC3HUXaRPzuSykuC
	sCDKCt4WZaxuwY6uU5xg1MQkF4EsJ+ToS3k911OgkE7jDeJlBtlhYa0mHxjMZ4gibuVl55tbhUj
	2kxSnnKtWjbgfqIYLpCfaM2hXOlE8GSwxKY1JMLh0coJENUEl2aw0Y9I2Ko4MiiZTfjCgK9OILI
	ARuR2ZfhCf20eZOgHp/QPHo2gZcCugqGynFHsp+49+Sgeq0e1v7zgMniInShV7c1CChTYu0XnBh
	HifcxPddTXhmEx06R1W+257IqlFkeZdimoNOQVtQI5Lspk2pmW/3Bfr8QGBXRE3nSRBpqKp/Bae
	KIKfopbEajQ6Y8AB1Wdw9hOmMH476zRdJTdh5fdLstDr8la0tXfnSOVTFnxgsSwChy7pZqgVSaC
	wwwMrGjBmxL1/+gkFvrdh+qWH4jdnpxJBpOH1Ai6+xqwyIiFz85cembR3pa+8GGQ==
X-Received: by 2002:a05:693c:26cb:b0:34c:4f53:60bc with SMTP id 5a478bee46e88-34f15075fffmr2692379eec.12.1790947515566;
        Fri, 02 Oct 2026 06:25:15 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f303e3sm8194198eec.5.2026.10.02.06.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:25:15 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next 0/4] bpf: Apply the rewrites of bpf_do_misc_fixups() at once
Date: Fri,  2 Oct 2026 21:25:06 +0800
Message-ID: <20261002132506.4108655-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DLUBNPLXRU86.358M4SOQJIGWI@gmail.com>
References: <20261001-bpf-verifier-patch-batch-v1-0-a12df8a09160@gmail.com> <DLUBNPLXRU86.358M4SOQJIGWI@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Oct 02, 2026 at 11:39 AM Alexei Starovoitov wrote:
> That's not going to fly.
> After this series there are two implementations of the same thing.
[...]
> Jiong's RFC converted all passes and deleted the old code in the
> last patch:
> https://lore.kernel.org/bpf/1562275611-31790-1-git-send-email-jiong.wang@netronome.com/
> Pls do the same in one series. One-off patches can be add + commit.

Agreed. v2 will move all passes to the list, turn
bpf_patch_insn_data() into add + commit, and remove
adjust_insn_aux_data(), bpf_adj_branches() and the per-patch adjust
helpers in the last patch. That also covers the bot's comment on
patch 1.

> That's veristat on x86.
> test_progs loads pyperf with BPF_F_TEST_RND_HI32, and s390, riscv,
> powerpc need zext. bpf_opt_subreg_zext_lo32_rnd_hi32() does more
> patches than misc_fixups there, I think, and it has one call site.

Right. On x86 with BPF_F_TEST_RND_HI32:

                  patches          load time
                  zext    misc     flag off   flag on
  pyperf180       4610     930     0.587 s    1.390 s
  pyperf600       7620    1530     1.496 s    4.105 s

Patching is 67% of the profile of pyperf180 with the flag, 57% in
bpf_opt_subreg_zext_lo32_rnd_hi32() alone. v2 will report both cases.

> That's unexpected. Pls share the perf report.

perf record -F 4999 --all-kernel -g -- veristat -q pyperf180.bpf.o,
bpf-next 6a75c73eebd4, x86_64 VM:

  Children    Self
   50.66%    0.12%  bpf_compute_live_registers
   50.43%    0.00%  bpf_compute_subprog_arg_access
   50.29%    0.67%  analyze_subprog
   49.47%    8.99%  compute_subprog_args.constprop.0
   39.08%    8.43%  arg_track_join
   25.71%   25.67%  __arg_track_join
   24.97%    0.62%  do_check_common
   21.49%    0.04%  __bpf_patch_insn_data
    4.07%    3.99%  arg_track_eq

pyperf180 has 2 subprogs, on_event and the global __get_frame_data,
but analyze_subprog() ran 458 times during that veristat run, which
loaded 6 programs counting libbpf's probes.
