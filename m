Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27532D5923
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 22:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772058955; cv=pass; b=lX1P4IB91T5bQAs7FaO8uQGZ9Ufp/2IHTY+3rcdzVZXR3wgMIiaUeRwfg6A12KAgRros744VA1zDC9fpjMnpjHySjPhpoFpaZtPhurR3xPb3xrNZpQZjN2v3WCJeUUcVr6anJphZ/EoipGYw+69Hydxv/uAeU/qXpkItmjQnzDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772058955; c=relaxed/simple;
	bh=rJ0im50NcDxt1NLpepA9U28G4sJ3XTUTBiq79IqFJqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EO0zVTpqgEsa2sWbVj+2qEbKHmPOeV5AUeYrCJ6pyLWGOYNnyzbjiVlFNlDat2EjVkXiGKlOM0Ee5qFcRlqBgAOi6byNmzU9MUTEFwjfhxxjnLRh0TnfIq8ixJlnaKBda7pqrhYGRtG9Uc7kTfQ47qikkjQS/Bpu8QpQJ4OnCJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a0W7bLKh; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a0W7bLKh"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b90bb0e8376so44471466b.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 14:35:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772058952; cv=none;
        d=google.com; s=arc-20240605;
        b=LL1OyjFx4tv5KDvXkBxXHyOVmKxGQC3bprtqM4GxIOdsOshVpFv7v8TQHvAxjziGhe
         yfQIlGYVDxxxxHaTWoWCI1SWlippsa9vOjegFggUavr2GleVmARq96hzRzPrHP9CkoNI
         zMyfTgjgTE0v3W5sG3NQ8jvYewxAV0QpG3+qkm0frpUfGx1SE+/4Vd559uTToBVITsO4
         BEMwt3dwQHLdXlh5fQFy81+fI121PwcTFPawrHr4F5XB551VWLnl3/+dSS58VUtRPFov
         zJutAHmye+FVAE30b4BksVNi88UqPTu1gv1DjH4OYcNhlbq60KymIOjJC9lt6HurmNBd
         BRoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9KYN+EboMy+wJoEldSrgFbbvEm7MGstDFP5WO2DlG0s=;
        fh=grX0EoKXzZqvYV0fMRRCrabHVMSFBwtxIYtYTpeUXBA=;
        b=Vx9C+MKjNkTVa2BJFqFRLs78A7zSfq1jNZ9AlJ1QuOtdfDUCC17LaIeiFy7f/NuATM
         F+nxkH7undIhth+Rsq+8a5TJ1tK5oqj0D0sZOF22vdQ2ChuAMoLeI+x8rh+z2kO7VuGy
         RD1RstJNhVbWeshCDrzGhy+Lyzgf1m0Nd/ooi93CBIUfmuCOeHWLTEk2NOa6ocqGL3e2
         5vxD/icE3NTmPV8+0MbSL+4/aSILeJBG/uwwPQbYQV/m9kxRoFQeUPgEdEinfD0leQcE
         BgrT6a1APQhpzDeSN4phxfKfkBmlPAAahtX1bGz7ufOzfA0vlewuwjl1Ee9F3Y0mw7ep
         /kRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772058952; x=1772663752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KYN+EboMy+wJoEldSrgFbbvEm7MGstDFP5WO2DlG0s=;
        b=a0W7bLKhMoK4F2GnTT6DEJoeoqTGdeBjVoLZbw74Xzj6UXKA1X2zO0U3cUGjGOW887
         VRDedLUBY9G6Evmx+5Spjg82gvzCiMnK+QiHFaL3vtIxfrFBgG9BwpMTf/TTLCDSM7gB
         HEWQoNUAfEPWZ35sVMspW6ee0M9qMeMMW1PoYmTns1i331dM9R6TJTkkYYhHNMgvpag3
         Wnp5rV4PcpqNC9Tcsrx61HdlbAAm43n2fOsVeBRUrpctBxv+zm3zpjxBjsWO2b0r534Z
         xgW0Nqcn7WymBZTZROrfbXo7aOrTMBq8mNpfnhAY5MexkYk+ympT94TRA0ZxzG9xhC2e
         Cqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772058952; x=1772663752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9KYN+EboMy+wJoEldSrgFbbvEm7MGstDFP5WO2DlG0s=;
        b=jgrJYFiKfAbaVq/v+sOC3BAQI1Hef9C/2J3RmxqlJ+G/x1wCPCt3up/UkSu+dDCbBQ
         0B2lIRingUw7WHoAC9Hcv3SkTBe9HyVUsmV/dex61W0AVM2b77cSB8e29fiqCFT9GNjr
         7b4hPY88tS7aMD+EkHGXX7lsZe8ZVI+GbhufwEAwcjmUTZ4mI//OcyNt0KpbKrBFpkph
         twzuqMd2zmOLlUs74uRCih1DbCiwaWmoo0kLgJ0rn1oq6T4HXi/gk7YhvcchTKymX35f
         BrEat4lSPT5rOye9Zl+iMV0w8TxMuNflKlhWTu7qshYD3sfj4LEZMEsVQgtsRIkuSqp5
         xxOA==
X-Forwarded-Encrypted: i=1; AJvYcCVnnPtUh9cCF9ftQFDnpOIN5X7MNiSJBOg3jOQISlsvSWrBoKK4Z54wL/AUayaCY1DESowOpXPGJJEIMR5XVE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJWXBmjS8cKIhNOCUE2uKbJFNGrao21bVvbbIuS5JgrLxw39Y/
	mgbYs99qHFJ699woEvjZrxaL4fazEVQotz/UsShTup21zv+z0qCTDPf/Izy751VoOr2NqmiD9rR
	mAsNVnxUaBY3Rb0ybKjtIxGLJDcIZfjgDocOZDQNQ
X-Gm-Gg: ATEYQzx2A8UJcEzxf62ynrfcQUuznt3OepifEiW5cEB+qOfDQhwA9kTrP98K/tp/k0W
	0d9ywskwfQVRmRhioQ0/V81rYKd8b9wu/ycpoEPjcHPn4NtVrxttt/nFQWejPKaD9kLUAZzsQaj
	zktJhkNONP6wQuSHAQgdqEbQc4zU5tVg/cE06hsM5wLHGKVn5fx1WLvtQ6umhTdkbLKAGEtAiWS
	h9NwEW9nsnjupW+sKFy5cX9x1m0FMe50J3oLFV0Q/wURirrf2DSu0ln6zKV4Jqs3ldrSR8B86M3
	aqHeF8ru1u6s0+V7T9SjxELdzz4H6LdEbv8mUQ==
X-Received: by 2002:a17:907:d94:b0:b83:3295:15d2 with SMTP id
 a640c23a62f3a-b93572a6e6amr39884166b.30.1772058951635; Wed, 25 Feb 2026
 14:35:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225210820.177674-2-wusamuel@google.com> <757bc1b31d0a6aa67c687c05fea88d97a7568fad0a3c2a880c28b931906fe315@mail.kernel.org>
In-Reply-To: <757bc1b31d0a6aa67c687c05fea88d97a7568fad0a3c2a880c28b931906fe315@mail.kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Feb 2026 14:35:40 -0800
X-Gm-Features: AaiRm53NmwvDCUKvRrbz-nVnwFT5sg5XR_DZ95o1vOa09ctUZKnFFOaIhSv3yZc
Message-ID: <CAG2KctpvHaw-pZzvL=q0oRqwyiVXOs9iebBe6QEDr4bpzbUoMg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 1/2] bpf: Add wakeup_source iterator
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, martin.lau@kernel.org, clm@meta.com, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 2:03=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> > diff --git a/kernel/bpf/wakeup_source_iter.c b/kernel/bpf/wakeup_source=
_iter.c
> > --- /dev/null
> > +++ b/kernel/bpf/wakeup_source_iter.c
>
> [ ... ]
>
> > +static void wakeup_source_iter_seq_stop(struct seq_file *seq, void *v)
> > +{
> > +     int *srcuidx =3D seq->private;
> > +
> > +     if (*srcuidx >=3D 0)
> > +             wakeup_sources_read_unlock(*srcuidx);
> > +     *srcuidx =3D -1;
> > +}
>
> Should wakeup_source_iter_seq_stop() call
> __wakeup_source_seq_show(seq, v, true) when v is NULL, before
> releasing the SRCU lock?

This is the same response as in v3 and v4, but I don't think it's
necessary here since we don't need any additional output after
finalization, such as printing a footer.

I understand it that bpf-next is now open for processing since the
merge window is closed, so unless a human reviewer has a different
opinion on this I'll ignore this AI feedback for now.

> [ ... ]
