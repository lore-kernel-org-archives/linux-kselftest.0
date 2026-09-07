Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7165A372058
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 05:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788760024; cv=pass; b=cCnuC3TK7MMHi1pKLDHeZ40t4O6srx5toEFuVooDuCLCxymiZ0mAETlaFLRZFFIaQJ0Libi+x7q0fTw6i8ZNbxTDq9bfzZeOcGOgpbrxGk37/ZlaUrxUiG1G5EvuUKaFJLx5wT+j6+2le+mEkgcY+p53xSbRQEeP6dR+eWD+pfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788760024; c=relaxed/simple;
	bh=RUgzcORyckA+8dmosj3W4O7LpXuF1V+EFIaKxpkao/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abKgcH6MiQdNIezksQ++EERsXyPcZOnBTmB8X7JTeCnFvNaIcgUocQqyTaxvTuE21MIlTgGtvKBEYX9ISAKftvkdzTfHy9I+ZoihfaBv6tkTurHGc3WWA4DFyv2Ajrgn2tydkCaNaORbbT5UzZxHUKDdPkIP7kowli7DtC+MkJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IkamvXQD; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IkamvXQD"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso254341cf.1
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 22:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788760022; cv=none;
        d=google.com; s=arc-20260327;
        b=gy6l3S/isyVHSS9YvvnuDVayv+vQnGmIi6LdS73bdBK6kGkrpi1LYBfI7GwwaNQ6lp
         nRxSp8TUsLNnmy3cBVIP6YgfLZiNHTP9e9O8iPano3eZdzgoSzs9N8nw+VtpWfLFJ/Hw
         VojOY8oGSuJ9am7AuGOzjZxvuEC6G0RhLuKI04Qnr7RPB34wOr+xMqoASyVjAReEU5+9
         1KmufIcTELXUY2iOTX3jxhZC7ML21MkjrbtxLrygSj9a2iO+LSnCCis9OZAC3qBVlB16
         zUv8/YL8ELC1GigpsbzOc9a1rStFE3nS87BXyVrb2dEvDBYlyy4T5vL/BoAm46YTnjUf
         Itpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RUgzcORyckA+8dmosj3W4O7LpXuF1V+EFIaKxpkao/0=;
        fh=KekdtRavms3OvkOCkyitmT9QGDbfUwIVi2tgavR85jM=;
        b=EBB6n8Nc/8Bv6VqbX+OfgqEFe+FwLsfwIc1A3jgyIhcu8f8HjOJdRY3JMPOvNXE62m
         3QNpc3E954OVQkpc5Fn2eIXOJJPCeaK561vhsr+n2OjLCe03brdJXOMbbRmt3lpR0Cxv
         ZyXzq1OjVzzbvaduH+Q+il4xv4bL/bHQFlvSZsUU7SqrBDngF1XxMj4rr69M0bD+soJM
         pPf+Fj6vbhR5OEQue0uOYPMtci/H2/hCYYmIbR/l3uc/jO5ZUJZGtJDxe6h3MBHBB+KL
         7ewRSP9gbvuwzwF8sU665Ue7B7zAxpyTS49T7tpbnbXJn7hQdM4ZPElOQkZ4FlXmeXoO
         hZrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788760022; x=1789364822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RUgzcORyckA+8dmosj3W4O7LpXuF1V+EFIaKxpkao/0=;
        b=IkamvXQDnUCwsOAsZYjD+ZwShl62rlw7OIeABI1Pobtyljv0wOXYmEWk4mh4CLxoUH
         pr6dTP8SukVGHPvsoCXPmLeCWOHmxwy0Q3qiw5KyiDNeVp/897bI7LifuB3uNxgIcjZJ
         AQK72jd0PMRWeVPhIDJEQC968/ItcxQK9N4lS4jepeFpY1p3/TkyOGX73X+5+oWKefJg
         K7owoRSYh9UJ9BUCpRAF2rfXq2a2y/BUIdfoZqdLapfkjc9EsfBKaaz+Q3nl//vLJGI7
         vxmplUQqGcZO1B1LlkW+RjeT0xnyUAgfklLVfIkxGzpZh9loHKzlGHXKacWbIfilqWvo
         +nPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788760022; x=1789364822;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUgzcORyckA+8dmosj3W4O7LpXuF1V+EFIaKxpkao/0=;
        b=MGGysB/hJdPzJoOieGrMNHbRx8c3nT+e+vYcU6DLeBSty4Yhe9XLy1IQSXZ63Dvhd8
         xk54uSImT5Zdwab+VOIEMiGCcPOYlNff9IUyp7mFk35md4DrXocAOpXbXr4cAG0+sXLO
         MoaDuQQ76/o6pxx9uHAaSLn4lxUENCNdVIpbpA2wkNqm86s3zNlTa/38htKbVPCIGuGN
         XcRDNzIQnXx/0CQDg7KB1qWcZuMggBYlFBd+FB2+s5PWXujg25ycSk+hQCzEYkV3Z3ub
         rXW2/CBx/VMhBPPFhCS+C5zwnwqAhf+iR8KSkUcUJOx/fBEyHNMTuWyzEK3+rodL5Rbk
         25Zw==
X-Forwarded-Encrypted: i=1; AKwUvByFqutnd5mP8PCXTqoU+lW9kh/B6MDJZWbSDfuLs1wu4a3ggomadmVPUoMcWDcoO+cosGFDsvUcimL0AnMVZUQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mFziUibALtlmPtUBgn42NlQ951t94Z1MK3GOA9FqdRUERctJjm
	GsAwmSKADNrey5SanhL/z5KGS8H5NA6yIW3TwhZImHBBSCGuPX5gH3qNhmVSsgPLYjJOuwi9psp
	BfS3iGvqKsPhhzm7PHuDlGFrBqwHSmgQfWkG43aO6
X-Gm-Gg: AYBFou39zqFCwqdTya/20Yg34gGUiiTPAhk/HLGFAFIiySWVmPrnDj5aO5lH+RC/lZ6
	psoEgsz84a9UC1mKgISGZBqE/xps0yO+PHUYhjFPP6XUC0lnTLRsuF+elu8HC5X3qEboGLgJXs+
	z4/+J25RmmHm0bEZCPfqK0EJsOIHajVMgDv/sh2lKuuKtr+Aeh4d6TG5njTTau9CD7jb8ZOOsiq
	vZ0rBe8+SMyW3MHCGQ98yWd8cvVK1j+NnOe97pABvZSHvIh2ywP3JFSCruPRRkGcGDTxKD9FBbS
	vyYCigpRlp/1oGCgQAe1IzH2nE9xDS4NdZi08SM67X+8zWXYk9Hx3cTrL8abuRjEEyV9P+EIDuJ
	AR61ZfU2bkeKeQsQHd8kPuEWddK4=
X-Received: by 2002:ac8:5a56:0:b0:530:5ed7:50f0 with SMTP id
 d75a77b69052e-53084da738dmr6405881cf.13.1788760021899; Sun, 06 Sep 2026
 22:47:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904031912.2133476-1-tweek@google.com> <b965bb62-fcc8-4517-9947-24613650f1f5@linux.dev>
In-Reply-To: <b965bb62-fcc8-4517-9947-24613650f1f5@linux.dev>
From: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Date: Mon, 7 Sep 2026 15:46:43 +1000
X-Gm-Features: AcwNN1VHWc43-sC_3CoGJGewDfaRQRVxmRUaVlq04jRRQFeRsaJdgNEB0GaZUNE
Message-ID: <CA+zpnLc-WAqE9rA0PsjvOFe_YCZOdVj9YAzuayGXx0nhpqtw7g@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] selftests/bpf: Move verifier failure tests
 out of test_global_percpu_data
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Quentin Monnet <qmo@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Sid Nayyar <sidnayyar@google.com>, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 4:07=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> wr=
ote:
>
> On 4/9/26 11:19, Thi=C3=A9baud Weksteen wrote:
> > Commit 4c9241bd731a ("selftests/bpf: Add tests to verify global percpu
> > data") added test_global_percpu_data.c to LSKELS_EXTRA. Later, in commi=
t
> > 1ed2294b31fc ("selftests/bpf: Test verifier log for global percpu data"=
)
> > two verifier failure tests were added (verifier_strncmp and
> > verifier_snprintf), both marked as non-autoload (SEC("?kprobe")).
> >
> > When bpftool generates light skeletons, non-autoloaded programs are
> > skipped during loading, causing the loader program to store subsequent
> > program FDs into incorrect skeleton struct fields (e.g. dump_percpu_dat=
a's
> > FD was stored into verifier_strncmp's descriptor).
>
> IIUC, patch 2 will fix the issue totally.
>
> Better to add a subtest to verify both the issue and the fix?

Thanks for the review. That's right, patch 2 will fix the issue:
bpftool will fail to build any program that is set up that way. That's
why patch 1 is necessary; otherwise, the existing test would fail.

Just checking your suggestion: what I can do is add a new test to make
sure that dump_percpu_data is set up as expected (fd > 0). I can write
a new test_global_percpu_data_iter_lskel, that is similar to
test_global_percpu_data_iter, but for lskel?

I can also write a test to ensure that bpftool fails when light
skeletons are set up with autoload=3Dfalse?

Thanks,
