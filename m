Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903941;
	b=IQl8eCY1ftXwsx+yL12erxPPaNH/BrA04L+XYv8LRfB23fLyQi0klxbfSU4ODT3vNId8
	 ggL1CcTFbjeMmXnzQpGNU9d8DzEIc4NCwgsP3TljMDEcfcxQGBqIISPuQJqtnPZWTXtLs
	 0zl/mCSlRMZVqyQQwQ6qABq+4qCDJUtB27pdZ8Z0/LaT3SsugyFTH+sqS0rwYDRR++gzV
	 GcjUk0V1NFDp3PhNMQLskyD3CGZV/YbotW6DbuKnBtZamjlg4wUgi/JdtGn0EWloCKEEN
	 4PIK5oOHS6+CMj0ndNjZX9EIWCIT08XO56ZWytP+aiGVY9xXG17ZRGh4KqL9+1yVYpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=UGlayfD5Z/El6cdpm6ie0HDMH84kD107OWGXScU9uXE=;
	b=4afzMTewahgrnmBkF1OEvSiB3vXkddnXjVMMJCSfOPKJpc8DXauL2L8G4mbWBO94d1Wf
	 7CWLbBxYHzPeVpaJxgFqQzN+i6qxATe488B/TcAG0m35HJQiPoMI2DqKsMbxmuHjoluB1
	 bk+XPM/Kl0bf2rakvGTBQF8eCXFGamb1E/bKKBLf+O6KuPBofOXk+pRd9knOWDD/eQfk6
	 DGD73bHsUMMhMaNJSrH/ZcUmGCCCy31SYGQ13HvqpZPbVrDdhU3lzhwAuynLQnz7+OSq+
	 QESlnlCT204S0gdGFPbbsV0QYELC8siG+FqA8PaMgMOTpatRVz3utv9LLBpp6590b3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="QoCmkI1/";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD96D606A32C
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 08:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD96D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QoCmkI1/
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492690dd5daso4102907f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 00:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794903939; x=1795508739; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UGlayfD5Z/El6cdpm6ie0HDMH84kD107OWGXScU9uXE=;
        b=QoCmkI1/XbLLMuB5pWQjj6w7lhYbbqiM96jQW+pj9RZ000aRRl9S7H2qSmbtORMNOo
         ePt1TXAWzVIR/TrMeI58Zu3n81XgIdPHavzyhyljr/3uEJYZwsW6Sg14gd450d308jE0
         RrvE2vSlthe4MhW9V05IsJzW8g0CM3u+nfQ1hkfntpYQW6a4z4zmXmxD0w/TiuzDbd7U
         U8xZ2FexNWbZhSQ3d3pA0tlH/f0MOfn4O69UeuIyRM8vQ/YXTKpGPDyGoQczoxEfoynP
         BDcwZppUf46pJGXZ+RH52kug0iZSl25eld2NGIqCa+XVs4XFwFr0CZI1pzljVyhbNHw0
         NmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903939; x=1795508739;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGlayfD5Z/El6cdpm6ie0HDMH84kD107OWGXScU9uXE=;
        b=R+QLD5ZBZh1AKK55SKuvrkSry6RwdIDxawrU/0eeFXbfMKFVZtKLH0dpXVo7hd9fd3
         XIK9XF9dhfRyPiEn7xzANg5qhPnt9BHmti8yjllvkyUmEMKY+vDsBfZ998T7wGt/2j9y
         MBMlnmg7WmFEq5AXetOUKvnNRMjxGjvA1WjTpDgogHIqDOmc4/zwCWClXyQ2QinfmVij
         RlDOL5yac3yS79yqP7yDMO7hfojm/TDzuB9YfwwtjEnaHO7iQwy76thLYdqUNxH1at+F
         jCEu8Q3tYx38Ozlsqgy3SKGzd2rRIg2XFIQiLuOMD/hA8f/0IsP1BJYDMZIQn9+//GMT
         wuWw==
X-Forwarded-Encrypted: i=1; AL+hErGT3BpeYqqUJ1nr90jeZre7ztGOo2gh1GjbN9LombRqwWOS8IKRZ8spVCuklEjxLMXE9FvJqrMPALv6otw2gRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B/9MimZ+O1Rq2LvuJ7YDj8ulm8Ve+qV6ql26qTqdAR77n2gOx
	ZQaMRrC29tW+gdUzdFiulXXebGvAhzDw8auDo34SRy68YcAqpTT4DOI/EBlE6AGDlw3D
X-Gm-Gg: AZFdTZcMnDzgoebFFQTJ2OK4Q6K2wl5fuLljksbYu/t75qP3ziifiQkNQANUzKP0fJ+
	IpoeO2qk0/Rgdinr7uiGStQ+iAfdEf7ERY13T6b2Mwo/AyHzIgmVSdxRcGFk114zcX8evtbdq11
	+J2039wLZn+a2WKyYrHSCMgnj7dKzkHCGJQyFWKmEoC3gAYhxnaA7iq/EO2ua0447/WsGjldm7v
	WETvMKMKanVxcqgz4HMM9SJbpujoPH9pep9D1Yh4TdGTyE9ginaIRWGfSB4E2bCWVsIq1M0muFC
	k8wMMH95uoVAYRLRWnj0RZtCg70zYYM3moFElPa9BugEyz0wPVOmlMMza2aVMQGtiQJJojDj0eM
	KVnnB6dc1NqofkqIeiUB4icG9tWyVtK4A+HqRUuhUxN9lWesGKyqTG9eKv2XW22fBCEqtUcFOYo
	OHB95JjxqN2iSfYoiwfPW/f2HfQ8RRuJvBl9ijJhvYx6nW3ralt9zml2XE4HJp2qq3QmcTqxNsl
	hbEZgvPmEHRTHWZjogvik0GDApFUxyMMVQgEero+IGCZ2S392mQKpfaXs9oVVJsMIERaa0muRPX
	UXOSeeANSJxTL2FnElRgEt5ugYrDd+01d3B/c3PNpMxc34PyBVXGTDOc/dFP839G7YL3Db3YyKR
	u6Z6Ly76vfPkBsaGCwXd4kofZWQ03uTmIOf319g0eIrb9BwhPP9GuyG1hyUNGIPae8a6OCXM8UM
	9oxg==
X-Received: by 2002:a05:6000:2084:b0:492:46e:d4ce with SMTP id ffacd0b85a97d-49c6fd932c8mr25238543f8f.13.1794903938925;
        Tue, 17 Nov 2026 00:25:38 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm26907832f8f.28.2026.11.17.00.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:25:38 -0800 (PST)
Message-ID: <a9124bf1c858cef3e8ac06b1b2396dcb0e19e2a5.camel@amutable.com>
Subject: Re: [PATCH RFC v3 02/44] nvmet: check that the file backend
 supports ->{read,write}_iter
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
Date: Tue, 17 Nov 2026 09:25:36 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-2-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-2-8cbbea1cf34f@kernel.org>
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
> The file backend calls ->read_iter() and ->write_iter() of the
> backing
> file directly but never checks that they exist. Everything that isn't
> a
> block device ends up in the file backend. So a namespace pointing to
> a
> file without them calls a NULL pointer on its first I/O. Only
> buffered_io=3D1 gets that far as the O_DIRECT open fails for such
> files.
>=20
> Refuse them when the namespace is enabled the same way zloop does
> since
> commit 0c10f8a1a7ae ("zloop: check that the zone backing file support
> ->{read,write}_iter").
>=20
> Fixes: d5eff33ee6f8 ("nvmet: add simple file backed ns support")
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0drivers/nvme/target/io-cmd-file.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/nvme/target/io-cmd-file.c
> b/drivers/nvme/target/io-cmd-file.c
> index 695963dd932ee..dfa8aa46188c8 100644
> --- a/drivers/nvme/target/io-cmd-file.c
> +++ b/drivers/nvme/target/io-cmd-file.c
> @@ -47,6 +47,11 @@ int nvmet_file_ns_enable(struct nvmet_ns *ns)
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> +	if (!ns->file->f_op->read_iter || !ns->file->f_op-
> >write_iter) {
> +		ret =3D -EINVAL;
> +		goto err;
> +	}
> +
> =C2=A0	nvmet_file_ns_revalidate(ns);
> =C2=A0
> =C2=A0	/*
