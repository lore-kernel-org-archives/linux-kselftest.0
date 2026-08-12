Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DCD46EC67
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 15:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786546943; cv=pass; b=qBnDB3W4FtejTLhkH+Ky8IfFKzlx9Y30RM9/2oqizHWFtfsjR/MznhL/KcfbSAg2XDu3HhQWvPvBSyE1HF4U4ZAtY0Jtb8tWdu7avD/LsBSNIJMtIdj8Rq2Xj+TtomKNdupVtIo/Cd5qY/vccVuj6v3E7O/8ejVY9szjYvN8jnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786546943; c=relaxed/simple;
	bh=dXagVN0/kmU6TCjEQGzKhj+CDaoiXU32QOBD/KQk5sM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DcFgtoWG6VKb5DLTn1FEyXJ5FBGDRfjI+9UjPXIjohOr1/FLgPunvn3z7eMtflMUDNazOozGJGCnFjE+s3Ly29kyya5PhEi2cShvd/i9T5J677D4RDrTm2m4Vjj7ZWFa+3DK2AIsTyNfkkYrEHpQc8lPMDGymOnsWviqM7HMAAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vFsTbeWm; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vFsTbeWm"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso155239066b.3
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 08:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786546935; cv=none;
        d=google.com; s=arc-20260327;
        b=GNM72ep/ijc0keopPE5fbps45zUvChkLkU+Tor2QhWdkEvTGSEUb1YSlwDLfqtLDdM
         8uwOrj+HRQcXdhxcRqokX6Q5oa+qF1C4Ad32XJ2N9MmoIf/qRqZxauaP/Z6Xs+fMkjAC
         OJE7QM9chPCHE4aTBqitNj0/WdD1LC+6gggkJWnmoWBl3jfVnLn+6btKlB3fnG6k3VCz
         haXC5Yk4JO4jnrPl+6e4xYg1XiLz6XVNSyJmihHUKhqpygIHIO5x/XEMn2sDROew26Ii
         c31eHC9L3KNVxDVKFwxAKnzwKyyF87bG8jk4zm4LSZmM1aO1Omo1IEbNVOPMPUUcLKGn
         WVbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q5uEzbGEkmct8ZKXCwDqoN9egKEIy/PFu90SVjOVj20=;
        fh=0HQLU7W2ifdHq9oH0fdUpMemVsL5Ap5z+rFDjTGJcE4=;
        b=PFbpVr/mFClUJVKSfiBiGehqaTYntXF1S0L2u1shGE2rt3aGzSivQHJ+le9U6xN0yO
         c+cEePK74I/8Wr8jWUK90ZJPtNJo3h5db6FDlODyWs19FIC7WDfWlmjkaGLqMtzXtXOk
         l9oADX+RNgQG19+JO6sOylbBug7sUNGJZXgkUoLXgHLnmhkBEd9erp6O4ZhLvWSx7Nkn
         0m4SpFaP4hiIqlcDNha2pOsC8VlOBGLouLvsbCzR2av5gloeEfVKXi6Z8pthtX6aN94l
         n0nHus9LNmkK05iahhhPvjkqfyibWD/am1Z91s5zcPPyj0p1+MH1kNs4W9nf+CzV1+qc
         uS4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786546935; x=1787151735; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5uEzbGEkmct8ZKXCwDqoN9egKEIy/PFu90SVjOVj20=;
        b=vFsTbeWmT20H1Il3YQ0XWizui8UFdv2WwgedM2qieXWbIuTCtzgjrL6oNEhBsuIzrW
         sSVIX7zn2leQi9N7uE4eWOrln3hyM4BM519t82pztbAyTnD0W1nsn2+9SryTvDfX+xZA
         h7sIv8O44gx0yWyL60E9NpNQG2ZONQfstyEAd5z3Le/nQcuruRfXVaL5u6vuA+cZXa9F
         2KEGAc3UryGbBNLZJWsjPUJGjrlWiX0/ftGXqNiD4d+4yO4IxOqgbZdx2blwRjUBG4GJ
         1ECiBRojNWx5XT7I0puQMWob+ZYgSDnY68Mp8heCNtmEiCsFbAb2mYnRqPRox09aMOus
         WLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786546935; x=1787151735;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q5uEzbGEkmct8ZKXCwDqoN9egKEIy/PFu90SVjOVj20=;
        b=PCm+xIGCGnphtDXDXDYsxEsRcNLBq/PnCu1ZzPsEMpPm2aneu6nK9Y5L0PIB8CiA6p
         uaGoMjRFGCYwRM96XZS0uE/D836PaRjtJIEgCbT3b1d5WoMj+b4AWFm72L9vWlPGf7xL
         2XPcloGcDbxVCd0hYfCzgYbGNlp1Xmnls3Ie7WgWlhx/QxzzVdSVlILdyaN9HHLd8ca4
         Pr1NokUwP5NquKwugf8pdLSSsbJoS6RMG+hgrLa/bUARBV2F/fHtxgovXljhk2OgWteE
         Gv7gJYy1YnaZX8CPkBfEfkbN6D63uucK0WDJ494fvC+YjLM0QHVUACgJk67vZkMbcfCM
         WwHw==
X-Forwarded-Encrypted: i=1; AHgh+RqoNAQl11Bu5DUUjAAfcLLwpiqhnhffkXrgIbuGl6mTVUJA439jySQBJkQ9UldhQweQMwsm3mlBr8R27xJx/nw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWWJjOXVPLymlHidixCE4E24D4DI+htaC8FlboZ7IPjJexki3K
	Oh3cdjtmEB3DKrbqcSSA++Hw0EisP1Knn+gN773pk9qRMdrBjapALZnq9cjS00ATfFGnTi1HPOP
	I2YbwP/9pP7tQrHTu9BkIlRLJ5Hm+rz6YC4JXkIis1A==
X-Gm-Gg: AR+sD10qwyuRtmXzXGlNmdZ+0BtBlfGBcCf93BrlV6nrnVLQAfe2FC7kxgcVGioc0cr
	Ctwg1vZlmvnZ47o+5i/I5ZWX+eQLHjSbFZwvFaQOTYRFIvhoRs1jWUGIOFPLYK8iNsZ3jOIzbCH
	NYq8+NLlGSlShDbGPKjT/WQEY2FYYzGu33IYDrnO+2unnkn5hcrasUyvxJGHWWhI3B9JeFEYWvN
	NDK6EsGjmU5SDvjiyzf1+L/yxVbgI1+PgbUMuTlNtRsPwFSabIFP8CxBY0shtJ5VUaK1F54pCfg
	6VUAtvRKfgAiCtKwi10Q1i/SKE982JJb+zsAigJpLOI9EpCoplRE9WQDEb/Z58juFGOCwpeUQA=
	=
X-Received: by 2002:a17:907:980b:b0:c12:9b98:209e with SMTP id
 a640c23a62f3a-c20f300e2c3mr249056166b.23.1786546934618; Wed, 12 Aug 2026
 08:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811204123.3198370-1-tjmercier@google.com>
In-Reply-To: <20260811204123.3198370-1-tjmercier@google.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 12 Aug 2026 20:32:02 +0530
X-Gm-Features: AUfX_mxNO1BArOhzalHmBpnvLYxDFW9EBmuDhA91cv0HkIInUfoU4eE504H7mhY
Message-ID: <CAO_48GEUhpyeenX8Vu1NoDnvzib5FGv3rOBYNYwQEWu1-6cjaQ@mail.gmail.com>
Subject: Re: [PATCH] kselftests: dmabuf-heaps: Open heap device files O_RDONLY
To: "T.J. Mercier" <tjmercier@google.com>
Cc: benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, christian.koenig@amd.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello T J,

On Wed, 12 Aug 2026 at 02:11, T.J. Mercier <tjmercier@google.com> wrote:
>
> Write permissions on the /dev/dma_heap/* device files are not required
> to issue ioctls and allocate dmabufs. Applications should be opening
> these file as O_RDONLY. The BPF dmabuf_iter selftest already does
> this. [1]
>
> Users are pointing to these selftests as examples of how use dmabuf,
> and encountering permission errors on systems where write permissions
> are not available on /dev/dma_heap/*. Apply the principle of least
> privilege to selftests which open dmabuf heaps by removing the write
> access mode and using O_RDONLY for the open() instead.

Thanks for the patch.
>
> The same is true for the vgem test using /dev/dri/card.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c?h=v7.1#n49
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> ---
>  tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> index fc9694fc4e89..45b420e37c97 100644
> --- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> +++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> @@ -48,7 +48,7 @@ static int open_vgem(void)
>
>                 snprintf(name, 80, "%s%u", drmstr, i);
>
> -               fd = open(name, O_RDWR);
> +               fd = open(name, O_RDONLY);
>                 if (fd < 0)
>                         continue;
>
> @@ -96,7 +96,7 @@ static int dmabuf_heap_open(char *name)
>         if (ret < 0)
>                 ksft_exit_fail_msg("snprintf failed! %d\n", ret);
>
> -       fd = open(buf, O_RDWR);
> +       fd = open(buf, O_RDONLY);
>         if (fd < 0)
>                 ksft_exit_fail_msg("open %s failed: %s\n", buf, strerror(errno));
>
>
> base-commit: 9a11db68872055e6ead919bad04d6330851c522d
> --
> 2.55.0.679.g6767b8d81c-goog
>
