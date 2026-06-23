Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C2D388E7C
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 17:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782234755; cv=pass; b=h5HOwz629MTPFNRBcsOxyQjz8MuKRo/0T3yg8Kyfg86up3J7q3THWoP4u4ukIKqSTRKmEAXlhU+24GZ8v52pCGyc51ZjJioWP/smRNWg5hvf4TNzxZIKec5vQXF0aXDJe390BbVjduUsH4z0YbaV3ZG5eyuWx3HWMkWXjDJqVBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782234755; c=relaxed/simple;
	bh=hmR9D8Br+YBjZG2zebbyzPQBf1lj2xBVoaEGicS5Dc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQ1M8Mta9BZj/CanFNmeEYKXLtZT11OvOdi6wByjyqSAHUFvz4MnTvToI/pnMr2+v0qjJXVjjXasrI2I5LWGubxbCpoxMa8WymRd/9hwE9e7ycXJegKMbnlKWl24u+kAws2U6o73dDULMADN02af9jHom/xvBiyatypEetoq7cM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZIInnUlR; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZIInnUlR"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4629d80fa08so121227f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 10:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782234753; cv=none;
        d=google.com; s=arc-20240605;
        b=WK2a7Jgl+ATTyGSF5OtafO/xfJvKF6l4XbuGcGNdUDuVuKH5++s9f1cE5jJ3KuVbUt
         QU/aOvaIuVnGp1PTQzeRvrMHaf8XjGKU4M+/fuaXd4Epvqc1pSCC3wY93VmSgdaBg5+7
         mucllIQh8VxKDFMphKget0rtKbFXFga+vNyND+jYHPdA/CWro0H9n6W7WgR2DRGrJY9S
         HnN4HFnHm+m6eBiOzASqzwOCxMwQaoyDTCKazpxPQCTjVGK9XPYK5iXpXU1n36hZiUgr
         L/KwdrlKDKvFGw3sEyME39RnGjLMJ3gVXDNBbPG1mSRCXA5DbytTcyRbIMN3a5qx4oGn
         xczA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GQis8KO7+Cr37wQe2wy0qBtYljKSNFAIw/U+lZxu9Bk=;
        fh=HQNwwXzM0syOCI59CnDqtN7aZ0MLw1tNr7IZW89Q+gg=;
        b=AzaUyHEAWCneQYuKIfQpfRGEg4vzGT9dV01/Nu1KjpbqJq15AqXRgpdnGnNePbtqld
         hj34Q2h7v6Hd44PbCAxq9nKdx4umpAqT0K4YrS86e0KsVutY4l/LmOqreep2vobZ4FaF
         Ha0cAIc2JG7WZ1MwPmbme8RBdG/XHgoza38GtDqj+tRtssNdjj67EnyApf0JZ3spQPvf
         apk7mZ+vZwvKnRTGCTR7HuIwd1yX/ZWPargzzcR7FGwOetWvBaxAw3BMzRwg/ACVfRYG
         PRLwELJDBzQFxpBL7rbQemENcQf+sMLX4FAxlZnakysLRbgRtmaMxH352fjAsCfVXXU6
         HImQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782234753; x=1782839553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQis8KO7+Cr37wQe2wy0qBtYljKSNFAIw/U+lZxu9Bk=;
        b=ZIInnUlRpJBrBLa4YHmK1T/YeHww3CriuYJ+s05YmBTe9hKCb9ZRskiq3iOgtmPzFd
         BO5+sawX5DP/dYIkp48lyGPGLZuMlU2B5ExSz6tAaPXbflRW58jxxcbYBY3wy3+6VUHy
         BuAv1K2BT2xt+XlBgLMoXmDB+Us7uSmvTTxbrDRRhv5nnWvjCsyd7yvFRxohrkF6M/PU
         KImC9eeyFb9l/9wbKy3v/jFfZV5c0b6MFsfYsy5jWI5o1kvtNzCAVMMBR2X7c28sWRoh
         KkRWX0jEeHOEQo/qs3fbGUlQTtm0uuWVbu/2igo1pXV7K+rMeUPCowk4apnjv5mQ8zxO
         ocmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782234753; x=1782839553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GQis8KO7+Cr37wQe2wy0qBtYljKSNFAIw/U+lZxu9Bk=;
        b=FUsSc9s26VucxioMTjbDgRl/b4l4wu8KpvFZ4HABwXaU2LpUUHOjPVB7k8GKqWFUNO
         uG9BIN3lqMTBqwcpxG4LvvPpNp+mmK9YZ4yiEFbmSWAcSs2QeX/p/0UFpMJcNYuuhxqq
         fs+ZFTO0hN3RqSmrqp9mdKAd3CLofv1N3XbJBs4dwjyUqE+4yOnYtkPZ/tTYkKGH68vM
         Ab4Zxq+aBUPKE/ufcV+P+qNC/GQn0Vqe5FdHmRmWR1DBwOz0a/CEMDFLl6MEMl+6MD/z
         U3g7iHw4iCD32dI5cekq5KMxiqgdvwsU5SBLUzNP+loqQeYn7b6iq+rTRXxho8Y2BoZh
         WPig==
X-Forwarded-Encrypted: i=1; AHgh+RpawKjiA+KP7no6h+iQht/I2jZQIGYRuGjj7aVmtVfLUYHkS6IyJP4qlpmBH9oplcgG8/M+ENxHUo0iwud/cjo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyC+qe/c3vL/rriNn+eqzJ82NlmzMrYttFH8d9nvsOjSGZvssX
	m8c29dQL07JAXqL6mVd1dDW3onoPHm1YcmXFg8SCh9PZl29g5nmznL//K9HcZVGmndjEEDdFB7d
	s70MV0H3A5IQTbk9/Ia+m44wfjs7gJjw=
X-Gm-Gg: AfdE7cl4PO/+ycG2AfR1qoy8j9gRitwUFzJSgn3kwrmSuvlaRp8mtxR4clEfxWFpMSm
	uNUGvhQg+C83x3K3mJx37J1e30d4KYamb3tT0NRUePNQVq2Xle0pAjDtUK1U1usvKgz7pyHjGhe
	QpYHcsfgzCPrK/zKkZdk1k1W4mHRnTlQd0JVSXDVpMmP0TyC3UdTwG2mY6brF3HdF2Kb8PoNucR
	KOF/TQZvAbJ7OttDTnfkYnEXPPVoDfj5UISZE+ff34jvsPp3zi3kGtFyYeRNPvfmEkMeN9NGSwG
	zCNlBDKUpTmVEXWbmuEBYmR3aVN5vbfJOBPUB0o=
X-Received: by 2002:adf:f182:0:b0:460:6b0e:a75e with SMTP id
 ffacd0b85a97d-46506c35d0cmr25528866f8f.16.1782234752678; Tue, 23 Jun 2026
 10:12:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623111533.2285005-1-ptikhomirov@virtuozzo.com> <20260623111533.2285005-3-ptikhomirov@virtuozzo.com>
In-Reply-To: <20260623111533.2285005-3-ptikhomirov@virtuozzo.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 23 Jun 2026 10:12:20 -0700
X-Gm-Features: AVVi8CdfcxG5r5FMFto7l_ai_RfkpnO9NQCVALwgDokVA4D7LTvynw9skPuPn8c
Message-ID: <CAKEwX=OaKTfNqzwa=djLxZDeBbR1+DKdqDnxdfPfZFKB-K+ECA@mail.gmail.com>
Subject: Re: [PATCH 2/3] ovl: support cachestat() syscall on overlayfs files
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 4:15=E2=80=AFAM Pavel Tikhomirov
<ptikhomirov@virtuozzo.com> wrote:
>
> Overlayfs forwards data I/O to the real (upper/lower) file, so the page
> cache lives in the real inode's mapping and cachestat() on an overlay
> fd returned all zeroes.
>
> Implement the ->cachestat() file operation by forwarding to the real
> file via vfs_cachestat(), the same way ovl_fadvise() forwards
> for fadvise.
>
> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
> ---
>  fs/overlayfs/file.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/fs/overlayfs/file.c b/fs/overlayfs/file.c
> index 27cc07738f33b..a7e252a91ea43 100644
> --- a/fs/overlayfs/file.c
> +++ b/fs/overlayfs/file.c
> @@ -518,6 +518,21 @@ static int ovl_fadvise(struct file *file, loff_t off=
set, loff_t len, int advice)
>                 return vfs_fadvise(realfile, offset, len, advice);
>  }
>
> +#ifdef CONFIG_CACHESTAT_SYSCALL
> +static int ovl_cachestat(struct file *file, struct cachestat_range *csr,
> +                        struct cachestat *cs)
> +{
> +       struct file *realfile;
> +
> +       realfile =3D ovl_real_file(file);
> +       if (IS_ERR(realfile))
> +               return PTR_ERR(realfile);

We're propagating the error of ovl_real_file() all the way to
userspace right? I think we need to handle this.

For example, we might get -EIO here, which is unexpected and
undocumented from cachestat's POV.

Maybe handle it and just return -EBADF or sth like that (with some
updated documentations, etc.)

The rest LGTM, but I'll let overlayfs maintainers check the
overlayfs-specific bits :)

> +
> +       with_ovl_creds(file_inode(file)->i_sb)
> +               return vfs_cachestat(realfile, csr, cs);
> +}
