Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793990539;
	b=e8hfYHpnXVWAZyaNLLUUbK0si5fXyfjD0ogc4qbcRyDoPLzVN7VQJPWil65Nj4dTFR71
	 E30j7Q8GDPgcm0F2NJeFZvNxGjj8aU9NGiFYCc6R6I2pbducAZGPdpgrxsdt9iNXokcQh
	 IaCHDL+q5Fpuf/PkBi1UkZFu3AhwEAaFrm63f71A/NUn2WBZRjFGM8s1SdMbOkQ1j7ZU9
	 MIKpMA99iLLUpvhA48aozaRCxjmTOg6X4kHHt2lhb0XmPDBX0Yiy5GQWuBFqhyvxLrm68
	 ZqCiKCJsJOwE4AtFwXvFraGRDdM1F261Xwx3Pkx5vE3IG0/HtoSotPS2DfIEZyOfiEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9O0I1WlvitVAffqL6IMDmurKacq17pLSSS1ily/aCXQ=;
	b=0uDqsHJWPuHmYGpBSWgRGdvWpd9Vn4UN08u9zxIhvih66VLAxBHcnzCX/nHe1t5B56EM
	 nYzcEJCBzwozE4HTfhrux5LSkZc8bf3c87vabBAA8n16r1x87vn7XR1ZZxDeUv3a+FVjg
	 68iqEZ00HrffhVMFWdg0AnXu+IgdmsDagahrMXCUTMrUywryT64CdVkfqyClLhWGEXgy8
	 yIg2zWaLivwYA2st8llA2/eCjb+WJxqk6vZGkV5QH5VVIK1NuwXD7iw3pQFzC76ga9+Ya
	 Zg64L22EhTq4kjwJTYVP2N0byDDuu8ZE9Nagye/qp0AhVWgzSpw7pGQQZN3HhskG89g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Ltf/oDpk";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950B1606A32C
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 18:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 950B1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ltf/oDpk
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-535f598d126so25961cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 10:42:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793990537; cv=none;
        d=google.com; s=arc-20260327;
        b=mS2z1DEW9pMTXhqrkw7eZHvRDbGoTerM6CvRslDDRGTT9baY/5a5bUR/+Ir8jh0ZpB
         siLcsNMrvI1QUVO9bzjbqVMBA9vJbzSqnCv5zJ1HZnsnUvoFE7W7qGIlKchgSjt1MGxf
         mK6NVjsuCAv49KvYjgjoYoKPizOEQtyxDWxW4uvptsuNBVl3rQFvDcLz6hYCjmB5ocTd
         QsBqiVeSj7sAp072LwPM/0eHhtJT2VU/lVpefmVHLtjjm2HNxUPOIGMozXhTs+5Fu6o1
         QZ75D25mBr9df4sqWl0D83WM8CWE8YjTGcB8lTjd566wLkicSJB3D7uvHj1Zz1h/ZrF7
         0R8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9O0I1WlvitVAffqL6IMDmurKacq17pLSSS1ily/aCXQ=;
        fh=FJdGThDh4lmsEaBRQXgUYNuCftWvTxM+9aweUhazvCA=;
        b=s3LTxsPSEvcm+TYddmnJZpNc6MUBkYrz7PK/ahWxu0aA+UUt/8Udb0lRrux8DNLOqF
         Wvf0rudO1ZSL+anGqyRZTaM0akeS6LraCZz6Ud++gAXsadXWezawIeTduYiobjSM0Hlq
         VKs2C6VF/vb8TbHy/aybHxjOhf9BMVbpsXpaaSarNRXvM1jt8G5sr/B6JM5JCgtqPeNF
         nYOGY/zseBRCFFLN+E36vFF4LfAz810fxGFByv9JkmAxcDbVKVB0sJLfqvvtkRyrLuRP
         iewUMIaSnsEh6Eqmmf0AJnBMNQLCd/tgNwutxR1XWpH1++H7ZzK4GLaNBQU1tfKkLIch
         WETQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793990537; x=1794595337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9O0I1WlvitVAffqL6IMDmurKacq17pLSSS1ily/aCXQ=;
        b=Ltf/oDpkqac6bI1uJjUHiRwh1Kax9N6VmOnzZTU9UnR1nI5jR/ZJgtCgX872jJg12c
         OwBo6Gpy2AvgGNrKEJMqjYCMptK00JqkuY+CdFLSSHJm1ouwAxQabqukjUbIhSARx7AZ
         3qXkFzxBNIWGNn82I7DRDaQcqwYXyMH4pRX0VVDc/vhuNnKqxZaCAS0t7fvKgIip4I2H
         s1LJ89ykjtLx2eIRRtfdtJUAFMlwx6auuxaDJVSk9UHMx4JrhZRzKSA8GhUd0M8Jfz8n
         HJL2Noca5CmCLvc0376jFczCfDmr4t9rK+X0LdRMukeq+4BKYgvPtCaNT5XyWq5XWiKq
         ImlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990537; x=1794595337;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9O0I1WlvitVAffqL6IMDmurKacq17pLSSS1ily/aCXQ=;
        b=w9u0xJyB0faKFmMDO2ro/Xxt0iV7Y60VzblNWjsk5KSfcyCTcBn1oopq93Btq+0Ryx
         FqfyLNQEQAZ0O1QVvWl8oqaykL7JgG16MGGYvMMCQlA4HaYGG9vvOtR1rAfSk8kv3wdL
         aSctSWzZhELKCME0kE7I4ls1bMbgAWQSXoU3ORypJASmu1AS5rTQ0t47tCoIeJN8TeGs
         b9UP9YYFxmxC+aaqXDGEs+R1VuvB+E/lxO4Jc4KfGG8ZH/5DAW3H6SzlPBa34Tu3hqMI
         4bnBrkvT/dh2H42qp1iezNugFhJIMVpgU8F8foDkBEFnnkna5oBYeaStyruP3dlkCF9M
         hz0g==
X-Forwarded-Encrypted: i=1; AKwUvBw1Xorl3f276YwKn50kv1+VUmK4Uv5q42qS4in0v+Ij+95w9UGVDtwai73DBAx5GlAgTSfWZ1bOQnxwNvHDZsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8E54Dx/Www4194XFfFOiM4E1xpLua/zNIqxqu+tr5Tm/Kmt5iY
	nfACMNUDzImDoe5kyWcWJ2o8X2Bjwxm8GxnOpiqVRfA84jKVjFqNJOgoC6+KAosp3Qyzs/XwDI2
	CpCb2wdpxBFwY2fV9A4Yhgg3ZB+Qu/ztsimjtQLzxpSHgMZNWy9+vW+I8j3Y=
X-Gm-Gg: AYBFou0NFklSRPpBsrOGnObdGok45X7y52DLGeJQ1XrvmwweRrJP8drCSR9r0d6EaXD
	XOiCsPb/AVK95RPJVVeCj17pAZ1p87e+Gl0NUD14ALDQaAXksUFNp7rzdeS3V/QJgeIAFYY3XpD
	8A9goEd/0YoNCjwcauxTjEFoChyirApxVAi4lURaUNsH/UlJDu155NnFjtdz51MIgJJf4UnjbU6
	bSaiik3LyCASpZ8S5oMOE7LwVR29MKSsataEZd0TtwxLKd6E6k3NUR6PsXrk3XeOmUYEz7o2OE+
	7Z0eV+8MXUdwGc0s58uYQ4LVkcI+v5SAwYpAQ0YfSXLdF0+8XPy8fj67xsVa+UZMe8FmvTqRA6X
	abXCFooX2dn8GcZlWTz3uMrsr4GXtuIjKdA3nPvCh2G79aAqSoPsGsoS9wruOLuSSu1w962ouDa
	ozABfJ7e2pFjrkyyvn5GiKeOg=
X-Received: by 2002:a05:622a:90c:b0:533:9746:9a86 with SMTP id
 d75a77b69052e-54f5c235197mr3962781cf.5.1793990536696; Fri, 06 Nov 2026
 10:42:16 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260811204123.3198370-1-tjmercier@google.com>
 <CAO_48GEUhpyeenX8Vu1NoDnvzib5FGv3rOBYNYwQEWu1-6cjaQ@mail.gmail.com> <CABdmKX0uiX=QKFAYgwwBPHW-X3vh-Rm7w-cNp9EsJzQarTzDpQ@mail.gmail.com>
In-Reply-To: <CABdmKX0uiX=QKFAYgwwBPHW-X3vh-Rm7w-cNp9EsJzQarTzDpQ@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 6 Nov 2026 10:42:03 -0800
X-Gm-Features: AclHuK8a9YKRuRmcG8Sb2ftYE5SfU2l8w8O16-ruNv6bWd_JSLmgbTqw6Ki40U8
Message-ID: <CABdmKX3Ep0cAPakwKDYWnOkrFgfhsJAv9Mh1us+OfscyNeb2tw@mail.gmail.com>
Subject: Re: [PATCH] kselftests: dmabuf-heaps: Open heap device files O_RDONLY
To: Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com
Cc: benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 9:06=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Wed, Aug 12, 2026 at 8:02=E2=80=AFAM Sumit Semwal <sumit.semwal@linaro=
.org> wrote:
> >
> > Hello T J,
> >
> > On Wed, 12 Aug 2026 at 02:11, T.J. Mercier <tjmercier@google.com> wrote=
:
> > >
> > > Write permissions on the /dev/dma_heap/* device files are not require=
d
> > > to issue ioctls and allocate dmabufs. Applications should be opening
> > > these file as O_RDONLY. The BPF dmabuf_iter selftest already does
> > > this. [1]
> > >
> > > Users are pointing to these selftests as examples of how use dmabuf,
> > > and encountering permission errors on systems where write permissions
> > > are not available on /dev/dma_heap/*. Apply the principle of least
> > > privilege to selftests which open dmabuf heaps by removing the write
> > > access mode and using O_RDONLY for the open() instead.
> >
> > Thanks for the patch.
> > >
> > > The same is true for the vgem test using /dev/dri/card.
> > >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c?h=3Dv7.1#n49
> > >
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
>
> Thanks for the quick revieews John, Christian, and Sumit!

Hi, I don't think this has made it into any tree. Can this get picked up pl=
ease?
