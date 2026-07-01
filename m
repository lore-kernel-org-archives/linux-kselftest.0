Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF5C3815E8
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 20:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782938800; cv=pass; b=c7Hg7/+nLi9LDS2ZC498cflCpJTT0e6bJD1+ON8cA1FhpBp2EwXLPUUjVa74qNQDK5ge/p7atPz17kbpVim54HcwCnh65rPnGv1DXSTLJB6g1lgl9YUX/n5zv+8wHVCAdNYpPvxxSl445UPCjRQIlpzXvR/oeaXI2oNvRfihVyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782938800; c=relaxed/simple;
	bh=RojmrvKSHS5LSmtFILF0XQmAa/5JCgo7nPteL3bNh9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mzu/ZhFizvq2uTGQD2N2yYaCbcsNJyqz/Lvva+J2iJ1HNxQIrEcwsXiQrG1LLEoAwGIkVZnJlQyowVazMgfCH3YY2nnfQJ0PzxIzuNZTMRU+PqWnIN9Tnd6cyEpCfisOXY4M3mkzVk9eEnNOej3P6wPiYsK1LbGtQt9ckI5vKMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n22tdaLG; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n22tdaLG"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c821a50615so7744655ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 13:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782938798; cv=none;
        d=google.com; s=arc-20260327;
        b=p5/B1jyFBE8c9a6enSXxPV0nqyZ5SMVBssbIbsJKsW8SbwQK++jig7e9rpR/U3+rus
         T4T5oodASQ558FkedbtUoJdFy3Wi8r8EajT/HXxNQJ3io42pIkTyxZ8qty7sKwih/sE/
         Fmy/PeIw6iiY/F+HRAknhuTXFqPaKC8j630dt3TAQJH4fCWF0naTbwueruDBpwebFjW2
         BToNlIS0xpLpDsGUcSogxtMDSL2KXabnwHX4ufSANVRErFhNuZylf8sUhJ8m3BgcSgPT
         vgoWYi803D/2JvkqtV8ugDR4fF89iBvkPurPL7fWK0SyHVGQcTWna5PLAxCNqeAGZWeu
         c/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yjZxD1cg1vS2nweGbuL1y88ux4bBRWVLVkOZtd7axm0=;
        fh=IY6qt7scx+VJLk/ToAnt270JIIz+CDU97NWpxg4moVw=;
        b=ADcs6jfVL+0GQtFQVop4A80oggUmCv4htrjjq1Cl6CnGGyhIXFW4FiM119JpXwu/9B
         Cr8hZQCxaTGpJRARUgc0zk4yeC+jdBjM3nGVblBB4g7pRLF4Y8mayoCwjYUXUrediHk4
         vVf6PzULUy3FktDLX5USA9VpRFerUu3bEsjw1BpjDZW0P8uKZOOSSPwjVECUbbwpWp9O
         rCgOYqb50l81GcEjm0pbVe3OpoENL3TCde/uUr6mSuiWiMsz58/aynWk5wGE64g0UCR3
         FbPbNVaD0SVVvW5+3ccn5U0iLNWaE9wIZLU2eNAqa/jRLF9eukWuW31JnTUrPjXAd/PO
         iqrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782938798; x=1783543598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjZxD1cg1vS2nweGbuL1y88ux4bBRWVLVkOZtd7axm0=;
        b=n22tdaLGEdT8Udmh9bzmeau9F9cPB4YL4x/3TwFelAAWtPbDx6v0gWXcoQWmEz/DyB
         MpRKMbqXWVTrNaWNuABsrhZxb097xVqjSMQYoWwJ4ap28iNFzU7b6AtVDJqByFzWRhjJ
         Io1TxMad138E9WXN0dRc16jONOdzlglDnUC41b/ndLbA8L48CzBjeqmhO44mKb8IpO5g
         vjVEqteeRQL8t8Ki5TIk9epFWR1Vg53A4rOY1VxSUtk7lSNgZPSVp1GklBCbaxtzmEom
         oohm+o3gVX/CeoC4sgdIcJq9NdhxT3AusSieKzz1x16QYhI8nlsJB8mx++2HpHKpQncY
         EENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782938798; x=1783543598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yjZxD1cg1vS2nweGbuL1y88ux4bBRWVLVkOZtd7axm0=;
        b=qxaL5OHK3D7F0UiOaX1V8UO9FH8zVGcph8HG7+Y9hcUw5by5AhZnCzEm9i2btl7Rv9
         9qeLBEAEVMgcTftGUiluTUl691Rkf0jj1q/n3f2fiqv7PnYm4O/QaUrbegC7smF+m6v+
         Qpvp3QPIovctc49zzGnlsqgl9JBNaBx7MZKPzCZ+k/d15mNCgAqZx3zunYy9IT5mmZQg
         Fvmtg7qb4N9F1pq1ryVlX+NEHA5T4ma/wr+XSyhIF68EFFHUzrkJ3m8ISODcq781hVqI
         lS6ym20FB/syYBbCE/qrfQzIxS4dtQvoz9/2gjyjSXYDdkrtkJYK4tpwZ6f12dOPilkN
         EMBA==
X-Forwarded-Encrypted: i=1; AHgh+Rqfxp0YA4vWHL+omr1OFAsHJQAlPHr0e6ZtPYv0iMlTFOag96EVGY3Kj91G7ZxMnwQeiTA5xhNjcX2B0vUlB94=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgpQ8ha8wV/Uo8jYmLOy+LE6SqRPDTB+OTSvPHLj461SElQp2i
	MKwn3C482TW2gr8rxk8wOB3Yd2t1xlpeCugK+NKp2zQz13+Dm3TNLIeZazLBDpQIaOARqYXra8l
	Uh23QljkjWmhoUeXuG8ECk60j8cFJ72U=
X-Gm-Gg: AfdE7cnM7zsKFGjQhCzk0/yabNH/cn9KE2SnwlNtENzZTbChI2PwjfoUBUoedusUbUC
	OzB+cmkP4NUxofalxaTwqRKJvJxqnmAbhCHhiwbGLoX2otA+6ROKsznpdTLoKjPwqTHBeDsi6gi
	IS5MZYnO8XSthV+K5p0SYCLgF729V6PAzGPUTyWCKjf7mrQDT9r9gtqxQ1XFuKqIcFYj3gNYm9a
	IT3OfIoqpFE4yTOIqIcL3CE0p0FUYKfxWkHzRoi9DXHKYC8b7SRLp1D2EC5idZ5kR3HaIFXFr0O
	hNP2iSQ+ge2WUTpcfEz70BGEHNrRvcecXzQORA9ETMpho7Yoz1XMuQ==
X-Received: by 2002:a17:902:d4ce:b0:2ca:1bbe:c3d0 with SMTP id
 d9443c01a7336-2ca91227efcmr21654735ad.43.1782938798277; Wed, 01 Jul 2026
 13:46:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604031033.806727-1-chenyuan_fl@163.com> <20260610145059.113412-1-chenyuan_fl@163.com>
 <20260610145059.113412-3-chenyuan_fl@163.com>
In-Reply-To: <20260610145059.113412-3-chenyuan_fl@163.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 1 Jul 2026 13:46:25 -0700
X-Gm-Features: AVVi8Cc048TcgqKW0BWdZFzEbi25RateWHAZYZuQD3fYS1IrrzOUzGBWw3yq46M
Message-ID: <CAEf4BzZ849OG1XP6ZO351or3wqUViKtWHAii9vFyEZhu=4QS8w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/2] libbpf: fetch probeable prog type from
 token for feature probes
To: chenyuan_fl@163.com
Cc: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	chenyuan@kylinos.cn, daniel@iogearbox.net, eddyz87@gmail.com, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, mykyta.yatsenko5@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 7:51=E2=80=AFAM <chenyuan_fl@163.com> wrote:
>
> From: Yuan Chen <chenyuan@kylinos.cn>
>
> Feature probes (FEAT_GLOBAL_DATA, FEAT_PROG_NAME, etc.) hardcode
> SOCKET_FILTER or TRACEPOINT as the program type for their test
> loads.  When a BPF token restricts program types, these loads
> fail and the features are incorrectly reported as missing.
>
> Fetch the first probeable program type from the token's allowed_progs
> mask.  A new helper, token_probeable_prog_type(), queries the token
> and returns the first match from an 18-type list of program types
> known to accept trivial "return 0" programs without specific
> expected_attach_type.  Types requiring expected_attach_type
> (CGROUP_SOCK, CGROUP_SOCK_ADDR, LWT_*, NETFILTER, etc.) are
> intentionally excluded.  Without a token, defaults to SOCKET_FILTER.
>
> When the token has no probeable type (e.g. only STRUCT_OPS),
> conservatively assume the feature is supported: token creation
> proves the BPF subsystem works, and real issues will be caught
> during actual program/map loading.
>
> Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>
> ---
>  tools/lib/bpf/features.c | 97 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 89 insertions(+), 8 deletions(-)
>

This seems a bit too extreme. I've applied the first patch as it's
reasonable and small. For this one, we'll need to find a better
solution.

Can you explain the problems you are running into in practice with tokens?

> diff --git a/tools/lib/bpf/features.c b/tools/lib/bpf/features.c
> index b7e388f99d0b..f008ee50e246 100644
> --- a/tools/lib/bpf/features.c
> +++ b/tools/lib/bpf/features.c
> @@ -19,6 +19,57 @@ int probe_fd(int fd)
>         return fd >=3D 0;
>  }

[...]
