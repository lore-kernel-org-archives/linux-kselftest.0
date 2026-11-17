Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903968;
	b=Ova5QX2+KuOL1tFwTbGna8l8oeO12zfXbnoUrJyap4gE1bYepBV59vm53jceiheDeJ/x
	 rA9bR6hmuCuE66IaWrjMhQqSvYBDGf8vANL1UVGE/RKYzQ14Yl9UODAJw6Z/VsTe1TFXG
	 W30qGt+mXjxWXKmjKmuzXywg4YVXLQZZBFn5afc0YKGlJTN5NR3Tv1XXte4vl4COSSbdl
	 Ix73CxcB8w0S3oN5NDqG2pXoSgF2RofzBcgtNYEIIrznxUeXkcyyv0gxYQWqJCDZZVzDG
	 QvlTfdSFM4wQZO54CQYj757I9vwNqAWPMTV78JFuOWbu19prcMR9Avm3OEiq7lXEBag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=z/NZRmC5bENRF/WsK1hUt6gARTy1xozW3x04wBCWbAk=;
	b=mUmiS77ZRUWd7wreafDF89qlthiZb1ddvsyI5JcZn7P6qzDM6IUG/fUwgd1yWKY3xbVI
	 EmAytQ7xkSHKw8Q89zV36R2OBmneaH6mp5YlSEEV9JH2rr657OLNcoWPbiZk/HTmlj+KN
	 b4Dl7t3r7hhvPFmZVW4AWSiETuvh38XbRuBGri5918Qll6t6d8BR/efScUcbRmL4oTLte
	 d0QzoDE37WZWlvKc3oqSv0PO+3fCHaGVUelYc9E/NDmFfvxqC3je9XyMztwUiNrEGQZXj
	 itk8DMs4kjmN2iPjGHFUlQ6HRbZppWGjl9AAHsuw7THvSr7/dMalL3vRZ6GgrZVBTmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cds43TFp;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F62606A33B
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 08:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28F62606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cds43TFp
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so62298f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 00:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794903965; x=1795508765; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=z/NZRmC5bENRF/WsK1hUt6gARTy1xozW3x04wBCWbAk=;
        b=cds43TFp7I9j7WPcDQvYfHpQ9LovbzzVif9J1GAb84gdrUsjaaD/ks8/CxWEGRZF0/
         68hyeBKuGnu6JbonI+DUrAk+S9ERoS7tOFFA4H5eAQDr7L4jclXV2ELfZ8mKm2Ufg0Vf
         wmDFKHpSFXtb9q6HdOEKHOgWOeHJI7n45fohFUmuSejGQMSPwWlozLhppiRP7NP6/RTN
         Xh3C0JkZ12tnXvLGCknth+xcOYp3m/oSfXqUlVI9cwzFe0Rue3P0S85bM03sQyFUoXwh
         8JJkMFcg0oB6zhSAQwaixAlqp7dYBZf2pow5RK/cSK97CWugz7jqMDtCMqYWg5eRSPcE
         y3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903965; x=1795508765;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/NZRmC5bENRF/WsK1hUt6gARTy1xozW3x04wBCWbAk=;
        b=NzerGlAXBxv9RHf7OHhC7gL9PshpxQA3qhXDNMO7b+HLI8u4HWPTYry9tSIA3BT9oX
         KiBF0qKjKCX024IH3IdMKvGA9l3w9JZalI1H2aaGBmUrElVg4QdpUyuPDguZq4iVRBG1
         wKyqzsedKSLeBBc7Qspa3f1msS81RZGr1vnUL+nfA70zlHDmLow9doZyRpKLIW7nvtrh
         MKqr73OYog3+01K80Uf+qHEK3XdzVelXmaHIcmXBcFJ1TbXDWM5Ynhfc1EbJZYZyBOMC
         EJ8h4PlcLhByHBc2PEIl5i4t53B7JcamnMyQei/9EfmwY+fL22rOMWjCFAGQKrYFa2ak
         u6Og==
X-Forwarded-Encrypted: i=1; AL+hErHeVR8I5ubTf6i4JpEts/CPVtXaHcIjVWL3xMJrdLDFrja3q9P+p7NCGHDJ7EP7C0Yzk+8HA616uFUyzB6V1VQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pex/PITlVkt5IuAwtDNOCfcPim3OftM3ssEQhK8TrjVL/YlmC
	KbckmrTxcAWWq8qPjdWfemGhup1wojV/ZdcdWUdMhw+T4Nx91j0IM8Q4oQxVB7ha4rus
X-Gm-Gg: AYBFou0RR3cwUWbmwoLEb3UTJrfxIPoqwhl2ug2TyNPmWWYRqNDA4M6oY4jSdFmrIGi
	UApvSAJNr4LyM2WPDfQfJvly5Wk9tA1LbixvxHK/306E1TY0xObAKrkuLWD8ayGcd0/V/FmsHIe
	yW2BCfm3GhUsp8V99Ks83dLEB6vW3hq8eCLXW9HVL5sdv563a2OA4UfeEbTnjiOuGXwYYu5ccCv
	TRQuzZHAmjblFi5eOrCLIwFhE+ehRP9VxvCqp7OF1UIryhPM9hpWuxs2KGBeZf17mBRdW8rP9G3
	Ajq7+X8af1RUQSdJs67V+6FEZkmzNlOme4TeKDXWO3Ejw89blchJi/RN1XDzFofMskFkyZNZVtj
	ACF2ZMDKB8sI6lQ1FaCxCmkK38clbtiKUbF7+sEustmCfOnQYgqL8qYyBrcIc9QRPlQeXExUzfk
	SfvKvLA2gSzTUxafMSAwowTQuXVFv+0bLm83XfGbAfSnNes2QJ7t4Ekhc2z0alhfsT5WMtVExF6
	hwH3bkm5FuTtdXrmZ3u1X08mEG7+q7nOW10fr/5YttEqtNkgedpVTp6fCLRhos4ws7asebsg4GM
	sb8sOePIIs5rXxNqhQ9PcjW2jr2oRp4WXfKUrdzXq1+FuC6k1MUIiz+d5/yXcSgl5WctZTFK9w2
	HYo0d+iJEkp3jzrxUEFN6CR7rPJhPtrsZX2UR3fn8CKeY9d7529Ovgklm
X-Received: by 2002:a05:600c:5493:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb783813a7mr42606245e9.10.1794903965400;
        Tue, 17 Nov 2026 00:26:05 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm12629125e9.15.2026.11.17.00.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:26:05 -0800 (PST)
Message-ID: <88041240268f70b218de7dfd58c41977d03a60d3.camel@amutable.com>
Subject: Re: [PATCH RFC v3 03/44] target: fileio: check that the backing
 file supports ->{read,write}_iter
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, Chris Down	 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:26:03 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-3-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-3-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> With fd_async_io=3D1 the fileio backend calls ->read_iter() and
> ->write_iter() of the backing file directly. The synchronous path
> goes
> through vfs_iter_read() and vfs_iter_write() which check for them but
> the aio path doesn't. So a backing file without them calls a NULL
> pointer on its first I/O.
>=20
> Refuse such files when configuring the device. On the synchronous
> path
> every read or write that needed the missing method failed with EINVAL
> anyway.
>=20
> Fixes: 769031c92c8b ("scsi: target: target/file: Add support of
> direct and async I/O")
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0drivers/target/target_core_file.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/target/target_core_file.c
> b/drivers/target/target_core_file.c
> index ab9824a4852f1..a5391e57e9aa5 100644
> --- a/drivers/target/target_core_file.c
> +++ b/drivers/target/target_core_file.c
> @@ -144,6 +144,14 @@ static int fd_configure_device(struct se_device
> *dev)
> =C2=A0		goto fail;
> =C2=A0	}
> =C2=A0	fd_dev->fd_file =3D file;
> +
> +	if (!file->f_op->read_iter || !file->f_op->write_iter) {
> +		pr_err("FILEIO: %s lacks ->read_iter or -
> >write_iter\n",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd_dev->fd_dev_name);
> +		ret =3D -EINVAL;
> +		goto fail;
> +	}
> +
> =C2=A0	/*
> =C2=A0	 * If using a block backend with this struct file, we
> extract
> =C2=A0	 * fd_dev->fd_[block,dev]_size from struct block_device.
