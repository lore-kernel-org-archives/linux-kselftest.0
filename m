Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792771152;
	b=WbjWYkK/1E+abwLLGb4S/diCJbUO2RvYJMQuFwvLsW2Ze126RrxaT2UVney1i+apvvd+
	 X3eukUDfLJzRuR0w7vo6ppDtxjRLyJ2d3RdBqk5p1OOmOCsfGhxX45SWmHXAjx2SB4uCP
	 h0zgx4N0m183uIe9feJm0aVK5hpzsaDIGe4yvtiYjZr2NeS1wNOamvm6P67v6xKVqzcis
	 DCl0ddmvJmcgQINJKKupp4oI2NtKvulT06H2y82mI02/ux52ui3tqbPcHqxKSefXdfTxD
	 c/45m8LV2UBxfDhjp5LOSWYeWf7PxNpAFqpkZSHYxzvlQD7gwmYrTYvopuN5/+SIKgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792771152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=nlo4Rbpa5QmCWecn+jb+dgeDkwh72cCXtNG3YBtAJlc=;
	b=cQESh+FdskP4A2WqeJtda0kCNOeLcWdF/C4IFng2jio2boqEQv8v8yCb5bfZ3lmfzRcj
	 NnkqlwP1K/0smcp9NqCcoeEbPRQtiMB3zJVmEAHXiFEwvHZZpNuLw5ad6C1pwg4SrNmnP
	 y+nLtGuO4PShUGdJ8hisjOEkXbgGaaJe3vQCfOO7bORgDRgD/bB16L1dhRCouoIZGzUkM
	 mUcjtxVYi2zSrq12pTojVpbBq/tj11cGmKoOTNbgeM+XQn0FB3Yh5PRoO56NWVWQOXGf7
	 iqXWgJEBjhnaazfiaTy6IG+AO0FhZL21btVXdinoJZFWuDeNNIsB5M6clinZZ4SDkrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H9vWS37D;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA778606A31A
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 15:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA778606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H9vWS37D
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so445965a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 08:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792771151; x=1793375951; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nlo4Rbpa5QmCWecn+jb+dgeDkwh72cCXtNG3YBtAJlc=;
        b=H9vWS37DzwRcOSAFaiuY3PFfDcMzE0UJ6jlQQRq1fU0lg+mDLs0wT2dHhQ5p48MWGb
         QzI3F5PTmLQoWcvlyxiY6RjCFVTqRJhLek6/p1VuOn/oFAigp7SLFR7xy4ZnXsysrmqZ
         AB/s9x7AjW1fmobiw3Hz6BAFqyhYA8MXdly/4U3uYMn5JLXle/1dLS4HacBjT/ZTYjHg
         bsSAOPleC4qBWVdxAp0otDscF8se1n3cz4ux8fYbz0wTxbrZYAQePftNAAL1XcL3XcIB
         avbAKw/1mGESeGLsNMyrVLaBgyUUqPX2YyX00a2t5ba7pT+6BLNzdw1UNVQPnj/FoVad
         HlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792771151; x=1793375951;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nlo4Rbpa5QmCWecn+jb+dgeDkwh72cCXtNG3YBtAJlc=;
        b=fvQplegGRYelDceqHtclClaNFSHKIuTXSJ7xPBnorpl2nE/gpryHuKS+aVWixrDt/0
         4f2J5et4PO8VBt5k8BJmoFxSbUPqQtTd1eh4uzR3/uMRXFGKwNXBxhL0/cw8qN2oigEM
         Ul1ndRMSru2/IYzhh58v6gHZjfZRvm89oEBNcfUtN68vA+Y5eQBnRjKPz1FbDgP0dzPu
         mUeT/oR0hvvAf8hDqqg2V4zLgGQ8oXOplpzxZCFwbpm89VC6cM2ubBZr/S6P87jfj0CX
         H64h5RClJt5uYzNN1wgcTLqtaWMW6AUuPlZGGNexUcN0eUx37SvNAFW6iprfAkwKv//t
         nKSg==
X-Forwarded-Encrypted: i=1; AKwUvBxOctG+ZwlhAFQq2Nb93L8dhZS+YJmtbtkgO4ZCz/qF5/rKoSE3pyPbvb6Zgw6O0ryAejsRmdjwbMkhFhGCu68=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBX7vroVL4degj5e8HfzZA9rqkzMeA/EYYOCAQG/IBT4LkA4IZ
	SD0b0QR88SuWBYtHv90Vi5wAGYwrtLHkFh8i2tIVGMseqgzVV/53zciy
X-Gm-Gg: AYBFou2+rQdP8bBH1rd6NY41Hgsnr3ouhTmU0fT/ACB0yn0s/Ai5zZPHIbdml+k25+n
	Wd1r5z2B86QXFrm4JgjBUFQ2SxBpQX7Trnh9WmGfRNXrS3qBTunwdDWpXO8XREmNi08/q8Asv0y
	di8dIFayANgMH7TuUTFi3wG2XsxMT0MoeBhHeyzFPVAiuNpWiopq7Xcp4ydmkUMv+XYsT3nW1OQ
	pnABPwDkV4XxnKHq/DWHV31W3PogR/sN0CsEEoSG2V+AvS9HRiAx9l+UAKkDvJNCtXQk53l2a+r
	M6tRo+S1CFXfsSaRC+hW4HNOCVulw4843G2XrB1Cc/eN1h6xc0rHuxI16JyWU77yh5rYhPvVlXU
	pQbpp7RJJRckpMbO+7oVDwiSC4+1TnN9h2vcCiIM0FZe8NLRX1TGoII/na85O8SINXnCxs0JPpW
	mD5LMXpELyOPhJMd9fRJD2e3IDJdmkd6Mk2Ey9bINIqvvvm313Lkszf2L5YOUa6tWkukQVBCqwJ
	WOdvlNTZX46so/sAgH0Sz6wOsfULLaxd5YJ32WGeHQlRZ4n0TGotzcWDmt4SJ4u/MsM/h9VDSRY
	Zincs94uRG8ZLGz+w6hFQNBuMxbR9ohITZ0gTcON2KyP+rFJsAw3tusq4VUX
X-Received: by 2002:a17:90b:2752:b0:3aa:fc22:8aad with SMTP id 98e67ed59e1d1-3adce7cab6fmr2434265a91.54.1792771150833;
        Fri, 23 Oct 2026 08:59:10 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3addd7b5a46sm742463a91.6.2026.10.23.08.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 08:59:10 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Oct 2026 15:59:10 +0000
Message-Id: <DMCCC0KHY4VC.2O9M91KEVRW0J@gmail.com>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapis.com>,
 <ihor.solodrai@linux.dev>, <shuah@kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH] libbpf: fix symbol resolution without .symtab
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Eduard Zateev" <hackerowskiy@gmail.com>, <bpf@vger.kernel.org>
In-Reply-To: <20261023141040.249597-1-hackerowskiy@gmail.com>
References: <20261023141040.249597-1-hackerowskiy@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Oct 23, 2026 at 07:10 AM Eduard Zateev <hackerowskiy@gmail.com> wrote:
> -TEST_GEN_FILES += $(TEST_KMODS) liburandom_read.so urandom_read sign-file uprobe_multi
> +TEST_GEN_FILES += $(TEST_KMODS) liburandom_read.so urandom_read sign-file uprobe_multi \
> +	uprobe_multi_stripped.so

The test will fail in test_progs-no_alu32 and test_progs-cpuv4.
cd_flavor_subdir() does chdir() into no_alu32/ and cpuv4/ and only
RUNNER_EXTRA_FILES are copied there. uprobe_multi_stripped.so is not
in that list, so elf_open("./uprobe_multi_stripped.so") returns -ENOENT
and the first ASSERT_OK_PTR() fails.
'make test_progs' won't build it either.

> +	if (!ASSERT_OK_PTR(link, "attach_uprobe_multi_stripped")) {
> +		link = NULL;
> +		goto cleanup;
> +	}
> +	bpf_link__destroy(link);
> +	link = NULL;

All three 'link = NULL' are dead code. Nothing reads it afterwards.

pw-bot: cr
