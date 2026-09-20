Received: from mail-oa2-f14.google.com (mail-oa2-f14.google.com [74.125.231.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D367233D4E9
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 13:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789911870; cv=pass; b=CS0oUoIxrzFFKvwwbjgJqStaaNZDVYE+Hw5ITOL8Llz2sE2GeVmJrm0mJT8N7EftR2kmhsruD3kge3rL2PhG/UrTLHnPxxbTwd75ApEWJCmYoC1XCyhKKWNsE3obnE4wQmkmqU9veMDu2sDPgYV4/tUOVS4mRNlOuF6f30mRWM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789911870; c=relaxed/simple;
	bh=UXA2zp3XI42BtFvhO8xS/jRT2Pk6aJkddDnJK1FECbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X/UzYdb4FmbCPwtyaYrheBj4BBN7UeLXtyINPczqF9Yhvlu67OmygnIXT3R6bQSdCDGIYw8OTtBlOkTkYrvZnqUljR0QZDqLpBe8zSS1LvtwcGJ+tgb+Q1WnvxoGLQ5cPa/1S5R2wktCFTM+68tkNRxswMjyutEyz5NHkgUegQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgyK3aQ/; arc=pass smtp.client-ip=74.125.231.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgyK3aQ/"
Received: by mail-oa2-f14.google.com with SMTP id 586e51a60fabf-4693691fde7so1441894fac.3
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 06:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789911866; cv=none;
        d=google.com; s=arc-20260327;
        b=Fp10MNKbqDhyn8CMJfS4KV4JBC/avHzoMef8ZwOaDTCABG4nyp2/uIyTVY4xM6dtaV
         ai6+/L/alG3Z+u+6SPqIZ+oS6GGZmx4uSoglD4R0uZ8rhXWOB6u6Je2jp6XWbisFn71G
         JUwH0MacNK4uGKYT6+TME2ko1I0HHKXsRQy9Wx7ytmSBd5gPZ+sWRgi/R66QNDxd0i5f
         lw5UOTNBmKWoj8qHe+f2aNm8gHUio5rBHRUKk/v8XJcCKktkQIEQO9rUJmdgDalUlJsg
         7JBLqMQE0fRrBKEKJckFm9ijmnOJ/itYvdcj/a+h4YfFJ4q7Toe2gz0lEqtOlc/1IwzI
         ck4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jEX4twDo/lUtcmDOQIlSIon0G7yYx0diVyTZgm1EyJs=;
        fh=LUH5eyGGwXH8/9XqnLjH023GkladZoHqzb4rbbEyLt4=;
        b=AGOl6wKx74SNvLsVHZbhzhi6sucibqiD3KaIIp0YPlDKPFTdklGERwnSSCAFrPUZrf
         nWbqUTLmYDJqHiCzI9oM9SnOu3o88QI6OfilIL+6oH3iCUzHwrsozZ7TdXtmC47SOE08
         y30LX1CfGQct15SiCloQN0JGWw4X20b/KmQETi8nL18MC4iuP5br21+QH+mFHucfFkdW
         1G25qkCtXOYVrr5C9Hl8ezJGcDfvzbZSl9uX4+EUih9RDUTNWkgw4c2/ox20DyFHk4B3
         BMvBCZkp90HLLVGZa1yrUuwLbPSgeanjzQy7lETXqXSI/qVtR6HAIZ21VtbUnX+k+LY4
         iIXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789911866; x=1790516666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jEX4twDo/lUtcmDOQIlSIon0G7yYx0diVyTZgm1EyJs=;
        b=MgyK3aQ/6h1HplUODTa1qy7WG0z8Z5ZdGNO0jOHmwacei06LtsH2Fk6oVa0IXXSrsn
         ndu0aaG56AS0YeFvEAR8ZUs0yRuMUMpuZiZHCPgvuFot1DgKOlMeGmsQvuX7GBRBP18b
         QXZW4oPS9vTsaOGkU3PeJwzgvOyvMI8zFDQJgxqNqD+ZZucweBFQeE4eAvWK820xXX0+
         itGJyuKMIztS8wjbPwZPt+slgpFESRDFhJvCzvEsou45HxdwMKYpewzLqVVcYxGESHpL
         jcyZ4AQ+aF2tX+mBg+ztnprVe3Rh1YEonH7Kb7/ZZ7oikbiu0kMLO52ZH7f9aQbInsbA
         2rDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789911866; x=1790516666;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEX4twDo/lUtcmDOQIlSIon0G7yYx0diVyTZgm1EyJs=;
        b=wMFIWN5zCKHT4oz3plGHpOAc5/yQiZg1Tt5boUkg/hXntxQTXsCKCZ4nNb+0hBsY1q
         iBb4VvTnS7mx62bkzEYMAZSasaeJpovzmgR9zHlyhXFPVM6U1wPvE57A3ajpwhC3dFEW
         TUU7ZijIlkeEosdicimNM2vbhpiWUND4OnJNZdXHFrarRJRdXYZYq9y0Rw1AGhTiEwWd
         xnk3Mu3EnnjHt0SRYslOhmjXcFQZAtu6wT1PfUkZsTqagLTHBktot0qwWx2M9aKfm53R
         lsQXj7BOt+BmdTzksZ1IKryfILqRm/x61hDsYkD/hislDD2bvkNjpzrWo2RX34MLSWhO
         TLHg==
X-Forwarded-Encrypted: i=1; AKwUvBzz1fWYaT28ygZY35GapTC3HvKemXsShU3tA/Si6JfmV6QYGCNRctSSdQHPEgIoCsibmbsNkttZd2VIc3oGJWI=@vger.kernel.org
X-Gm-Message-State: AFuF++nz6YAcAq3ilOcqJmXIaCFzQEOudqivlBz/24f1+/CJKOjHLPsk
	qxcoQDsfw4WNiIjT4JIrHl1xa0SaCPPyGN3K6Hgm4H/CEe2bgvCImNFrq6IYy5oSmjMQUJ95IRQ
	/Ho3RjW9IjUMlSI7x0IwXtFAQoTz/JM8=
X-Gm-Gg: AYBFou2UHYQcRQxG/opKvi5vl1WZCnlp7/xMu43YcHcmYXw4pMhcIsX/R1LKC4SJTQe
	51vyRr81DPJ6p6EZv7mglq9e3MLKkia4mEENFYpmRdMiBSZcXuHZv9K3weP09aZ2aTAGQdLipxf
	MKd05xy2HZEPnZxzhebV9Ju3JPNZf1bjdW52FLZvqXiuoTyu0HJVQ2M7Yx34qWsPsNUW5vjwboe
	TmSsssnFQvAz6GXSaYHWZvB4eSxooDuneDddhVl3byJj3hGDPZTTQvGPXtUxK805ArYZSKu5R8B
	CI7wCpKbUrgjwdqNf4uArXFBDcufwmziYyHQMAhlO7krJEAGe8tEfKT7tvQL9tlCQ5uwakAR+YF
	qh5sKqNBKH304lx8iWrmq2e8Yge+TddaCqT6NkmaTa+kCD3NfiQpnvbTn
X-Received: by 2002:a05:6870:b28e:b0:47b:7709:5568 with SMTP id
 586e51a60fabf-486e564dd74mr6640425fac.10.1789911866617; Sun, 20 Sep 2026
 06:44:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914110145.41627-2-dirk@gouders.net>
In-Reply-To: <20260914110145.41627-2-dirk@gouders.net>
From: Ming Lei <tom.leiming@gmail.com>
Date: Sun, 20 Sep 2026 08:44:15 -0500
X-Gm-Features: AcwNN1VT3jlE_HOBtpGzW4wVVv5zCIPL3np61n-V3xFqz7HoPcojwrQzLe6U4Bw
Message-ID: <CACVXFVNZga4LMOep2U9XgGHE1X0+FMESKL9uYmeAKETf2qu1yQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: ublk: fix unused_result error
To: Dirk Gouders <dirk@gouders.net>
Cc: Shuah Khan <shuah@kernel.org>, Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	Linux Kernel <linux-kernel@vger.kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 6:11=E2=80=AFAM Dirk Gouders <dirk@gouders.net> wro=
te:
>
> Commit 166b476b8dee (selftests/ublk: add shared memory zero-copy
> support in kublk, 2026-03-31) introduced a write(2), ignoring its
> return value and thus causing an error, when building.
>
> Fix this by using the common workaround "(void)!" to trick the
> compiler the result is being used.
>
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> ---
>  tools/testing/selftests/ublk/kublk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/ublk/kublk.c b/tools/testing/selftes=
ts/ublk/kublk.c
> index 2400b4615766..5b19bfcfa8d7 100644
> --- a/tools/testing/selftests/ublk/kublk.c
> +++ b/tools/testing/selftests/ublk/kublk.c
> @@ -1589,7 +1589,7 @@ static int ublk_start_daemon(const struct dev_ctx *=
ctx, struct ublk_dev *dev)
>
>         /* Signal listener thread to stop and wait for it */
>         if (linfo.stop_efd >=3D 0) {
> -               write(linfo.stop_efd, &stop_val, sizeof(stop_val));
> +               (void)!write(linfo.stop_efd, &stop_val, sizeof(stop_val))=
;
>                 pthread_join(listener, NULL);
>                 close(linfo.stop_efd);
>                 ublk_shmem_sock_destroy(dinfo->dev_id, linfo.sock_fd);

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming Lei
