Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794709751;
	b=lMu6ZJe4n+b6NN8hWjJhAUN8wwgGeNUbbSaDIL4m3Hc42r2shWxODz+jyse0g3yzAtJA
	 4JHDHgeDmVgEmp+IAD8+oOXhrtAQnfRBULtXf4VdphM1l4sV0/PJWP5Th1EpXT3x5OtS7
	 fE6VmMGRosKv7D0gdI27kqG3vy7nCA3UYZoto8RwoZeFjv1ubK8WCpoGP+FiWhmeBtAdN
	 vCS4LcUt/SFtOBMc0fyYDue5gRewsrNULzbqKVDYAIjtdv6Vyh16Iz/VsK/r4nIRgnIv6
	 YyQ6pe0zDJ5cEDxDefzLrvk6A/4GL23jx7z6DT5E8hWNBJ82fE7iZq/QNkSuHiWN7Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794709751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7CDE5oldwyToxMIHZaDAAROi1zR3/FKKlLBPz1nWp5Y=;
	b=GwUUHFW7D6pXykuPtsGOrJY2ZzovlOeA6RMMSew4KGlfnwa05WsSrh9rwNHzy9nOe/ts
	 JLy8iUPzXwroGYULVYizleZoGcNIMpYWDs9uCjqO6+z5btebJ57BS3YtNeIDKn5zKNQpo
	 MfsXkKYgNZXGmdtuM9zjOtvs/Ww+mal4VrL+N92IewJUaXsEaSINCacDM04kF7sdXWOp8
	 QDnSzgczcekIMAaiHX8wVXaQiO4wf7hKZOSDcZw5Luc32LHC4mKIBv/NWttisK+E99co3
	 FUVAihY8dMQ4uzYKyanrM1nMO26AoJDrdjzo9a5gdgDv1ZE8qSg26BLId31Fbi6cBBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+tStDCN;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE0E606A323
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 02:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EE0E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+tStDCN
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-862bb0a189aso33001a34.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 18:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794709750; x=1795314550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7CDE5oldwyToxMIHZaDAAROi1zR3/FKKlLBPz1nWp5Y=;
        b=T+tStDCNHyTwpVrwpY/oHLqkXZxok0j3rwq91AyNE0mZPek6fIP8b13nuvhrJIUKa6
         ab1Kh/ROheDyxFbx5YhNLKdwQPpuAfv+em7i6tO8eNAGl4rztkwPSbCiHY6B1jVvXfoN
         o4lluGVK+4Gg/8XVtXotyh/feX3v1JHh0z566htkVAuSIMVyBSfBm6WImqIRC6OFv0u3
         yrccVrcpg2IHV66qfkIJs756YbNS7o9c7PTtu0upsnyijkhazliAemD6XeL00AaMJkFs
         JCgxOroc3w4Ddt4bs4GJPrf/PjeaJBWcSqLwS2ntKBZNgeCUIsnbhLPWh5bxnmBLox8V
         uRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709750; x=1795314550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CDE5oldwyToxMIHZaDAAROi1zR3/FKKlLBPz1nWp5Y=;
        b=onsn/KHxzARED8cNYRzXYG9ndETNJC8xRpBrlH/6CCK3ZUvi4hKTEdSygJKU0Xb0fN
         7Ahg9smyaMHP0O/k56wK5xcRNIWcNExSLsyIKXtLpUnsU5vEJMcc7cY+a9Oer8fcD0wo
         tjk9E7mj12x/utSy6cTm9u9YgoaUGgxsnJLo+P401g/hsx6V7wx/fybMwQls4SJ1dQib
         rHcngRBO+uURwR4j6pTFcoTTUKAQjyqG+FiWauirTzkA6jsH+5n3qKCw+JtR+raD18l/
         VnathddfYPZdOAYt3A05oCmBB/mx1YfYMAxdfm+69cm7Zi+AZEwanPKk3jxrhxYtUNc0
         B3vA==
X-Forwarded-Encrypted: i=1; AL+hErFBCYwhtZkC4RncqKZGe/xwZopHtjIu2bYcrgbwlwv+r0/Z2plErS9okGt0Ag5YaFXtUimszN6httWxEdMLLOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B5HQpwIsAMcJs5GoctSYWWqyADqXR3lPL3b3KljoDk0pjmogw
	k+uqneOwi/Cb499Rdk0w2M2hD7ydFm5MYy2FNNDKvdoSvF3VRJXoaS5u
X-Gm-Gg: AYBFou0UyQsNmGxpINVHT3y0KG65Hk9x/L25oL/2FO2RtEXam8M6ubJfRGAZDJpnenv
	o8esvQAomnWI4TSAZ2ZZKnaZEjMa2xluH9/CMHDurKOCG4d8rZXcD4VwRBjKWnURiYfuy9YZyDU
	gvUOfmTkVrkjcCa/4F/82hpwlntsknuBVWdeDb2zQnrXR4rInt3BpycjrIKg2onbQOA9IA2fX2u
	bngxMUifyS6hpePgxxwXt0nA522z/upBO4alS5EMPaH7+fItDSHywgKAKSOL4IsoO0JkU4lKzIc
	NaZ6+/vumyubOtHtkm2FDvQGIWnOufEutUN9HgABFunVu4jCdMwtoo8UdKAGd8gy4R9hDfIEsEF
	ymPS6c7aSgaDpIRQhFCH8I170MWbSYGF4sxr7varIyAAOcYnwm8Oqnv/pAdsmLw1XoK2RgSnThk
	0uvJ3rVYZNecwlaawfXKjeeu8wqvV4xw01H+jvYiVMIgykgTV3g/hr3rHgqW+UQYPPdcxW1b3/2
	IanwvoH6WzTT3xD8LegrAaSWc4uppiRMe4MNv15VpkrJlBPT50bZAj90rwxVbC0zNxonKXWXof8
	tVuMX0fBCwNhq1y324lFC+bFKRZEulYkeZZHxJz1gAnHCXZUzJem6sBSGAKkKvJ07Qx/KvPqfjs
	Vyc+yxVhBxSrr22SqGOEI9fvvQumyilP/
X-Received: by 2002:a05:6808:14d2:b0:568:39f2:1254 with SMTP id 5614622812f47-56e64dfaba9mr5765056b6e.47.1794709750000;
        Sat, 14 Nov 2026 18:29:10 -0800 (PST)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc412c6sm6246722b6e.4.2026.11.14.18.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 18:29:09 -0800 (PST)
Date: Sat, 14 Nov 2026 20:29:04 -0600
From: Ming Lei <tom.leiming@gmail.com>
To: shao.mingyin@zte.com.cn
Cc: shuah@kernel.org, linux-block@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 4/4] selftests: ublk: clear reused batch SQE command flags
Message-ID: <avkY8Hy04c3QzXSv@fedora-laptop>
References: <202611112257529855AMDZLzg8ZmFDQ3fBstbi@zte.com.cn>
 <202611112258022807A4cJ4GoTzO_Q2qeMKeG1@zte.com.cn>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202611112258022807A4cJ4GoTzO_Q2qeMKeG1@zte.com.cn>

On Wed, Nov 11, 2026 at 10:58:02PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> Batch FETCH commands set IORING_URING_CMD_MULTISHOT and select a buffer.
> When a SQE slot is reused for a PREP or COMMIT command, batch command
> initialization overwrites the SQE flags but leaves uring_cmd_flags set.
> The multishot flag then disagrees with buffer selection, so
> io_uring_cmd_prep() rejects the command with -EINVAL. The completion
> assertion aborts kublk, leaving a recovery device QUIESCED or its CLI
> waiting for a daemon notification that will never arrive.
> 
> Clear rw_flags when initializing a batch command. The FETCH path sets
> its multishot flag explicitly afterwards.
> 
> Fixes: cb5a6b308700 ("selftests: ublk: handle UBLK_U_IO_FETCH_IO_CMDS")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
> Tested on next-20261105 with CONFIG_BLK_DEV_UBLK=y in a local QEMU/KVM
> VM (4 vCPUs, 4 GiB), using real kublk and fio. With the same diagnostic
> kernel and batch null workload, the original binary received -EINVAL
> for a multishot COMMIT without buffer selection and its daemon exited,
> leaving the device QUIESCED. With this change the daemon remained alive
> and the device stayed LIVE before deliberate device deletion.
> 
> The four recovery scripts also passed twice with this change and a
> separate fix for commits arriving after the quiesce cancellation scan.
> 
>  tools/testing/selftests/ublk/batch.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/ublk/batch.c b/tools/testing/selftests/ublk/batch.c
> index 625a9c32a..fcab2ca9e 100644
> --- a/tools/testing/selftests/ublk/batch.c
> +++ b/tools/testing/selftests/ublk/batch.c
> @@ -241,6 +241,7 @@ static void ublk_init_batch_cmd(struct ublk_thread *t, __u16 q_id,
>  
>  	sqe->fd	= 0;	/* dev->fds[0] */
>  	sqe->opcode	= IORING_OP_URING_CMD;
> +	sqe->rw_flags	= 0;

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming
