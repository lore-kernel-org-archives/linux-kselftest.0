Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164398;
	b=joy13e7JsNjoCG0G1qwzlUx38PnPgm/Gd4nEsdeVILHG6tuEOyFcaMMd+370V8o21n6s
	 hdfHkdA+PqAZX4Zn/sqLZnrHxH0bAjiAsEzTLeRbqsnK05Y3rQOWWijlgn19CmvsAcaBE
	 FWC7LjdRaXAYMiToJBKHt7PY2ccXolaqsy/wZlyu0LMJ9oI8vOYp6Q2GISJRIw9graTPV
	 yl+Hjk/wrQpLexTLVsZWTEoZMwbF4hdPoLshOmR+4QXMMKmTWURIYTWy8p7ibSmEM+ouY
	 haePQaU/y+m7Vr+xnRuCfF7frwvse4HW0w8WRgWyHm06r37h+h2peUt9OS4/sXOegow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
	b=ywl1UKZnJoxVaGR+9Uzm7pV7582jBd8KyLbe4lzzAraK4gLjblNJSyaa/mFSN+Oy+qyD
	 /a6hGRAP03QYYaW9Zs8f8U9x8X0Qm3Y3ot6+9D0au7W0nYiakZUgN7Db7/bwNm7bMZAsu
	 evOmjzaPh58JXv0dGIzbiqnCiL/w4cjjPhX6kWBfiv8LyQgAUBQDE8maqzd6rgk9EyuN4
	 fy1lCviKSEeNkRA9Syk6xYBGrsxZS7rvZbFVSJ5GY70PqLWFIpBPwVPoELsSDKCAt5PUU
	 uLoe3xPaDY0u1/qjRcQkDQA3WKtwXxlBjJlWEL5kjieIsYvhBiR4QfVxLKKlz4EPFVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R1wo23fo;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28907606A31C
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 18:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28907606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R1wo23fo
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso1148425e9.2
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 10:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164396; x=1794769196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=R1wo23foPI+Ww2Y4cpq43W07Mf+jit8FQA4fqT2qskAAUi1V7hffRwMpOB7+Qy2feP
         zp6ldJHSuMH1zABQV7szZf0nfxC20mZGpEGGAYUnTMCSA+D/eM3r40446T7et2bkfjiC
         dreWD5HpEsS9nqCgyxIq04eCKbTgTbecdrGOOUVU6ZMxtSJBu5DsFEalLWpDFdkgQ0uB
         aL4KHaRzCve8FwzdGS5EGGspb2mKb0HSEJeXONH5i7OkOKbeDnK72SKcvi+y7+XCn36O
         0hhhuZpIRf7jFenNh+SDQ8wSqcE+XBpGUeI1p8lamNeGQoxRmIsRYhy/w5iH4vbINrAq
         VQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164397; x=1794769197;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=YLi6gnFjV4tW5dbob28AZl78DJ7bsNjazRbWzFOcEGR6a8hEd06VI7JkYcXkgKpKEI
         Ft4Qq1jdWU0Q5oHEMgMvFz4JB33QUIDak1ev5yDC7rI71ETp6d19AYKjNoTxzNU5uDqx
         U8h22cg02r8Aghv2oCCUFboRx/N4cfr81D+Rr+R3grZuRTNxvRxeTAjhUbdPptoF8HM7
         pNhlhw+5InDBQm6EOpn+5d9JgTAZDiQ+vsIfl7LOr/bqFSzAimQUmd6sRp0vJUng4izV
         b/GNS3GOu1IxHA9mMB7zwkcLIqP+FyZ6Lf9PVQfNjG1mRD1IR7BwEUKM/m4JU0ldWLMg
         3AoA==
X-Forwarded-Encrypted: i=1; AL+hErHxt63HznrOqsw24Mg/IU1Uguk72Vd93WDcUgIWihvIiZsMruvUxDirpp3boEEC8s3grceNAJ8mIu9nE+AkKS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w6/vQKkoM5/uXC8GsLdymvJE4KolkSHBWMoy5ANdb02wB0IJQ
	juF/+vX01huTb2V++AXbXex0m57e3eUzfin3YU7XOUIF5EUIA81jyrJU4mokhlBM
X-Gm-Gg: AYBFou2lbUb/PD0/+D3KyY/6b1V4BcBSDP6CFeAC5mez5OA9/B+FlLliXvqLdJzLaiH
	GuoJE3rzQwJqEqeuOc7uw4CSGQM+a7uvSruZWOByt2c1LZQs/0WwgaUnWJ+qN4KvZ8y34RsGBJZ
	9HTDDSE+D0uN4Ss7jyEcM0hcYAb+11Advs8H1ggT3NsM+7TtPHM9pTlivrySJuSvbwftWZn92HX
	rqmrcjFMxURQr0hVcyWqwPWRE88E4KKeLC8HXifhZsVP/wWckpfrQFGRjo1ZK6kjkE6OZQwFEWC
	fOujxgS1hO77+1EvhsLsr7PrIGWEd+fGOwabCPSocEMw6wbmQxlX4V466AG7Tc/KGU4W/cw954k
	wh7nEwYmoqxbFBQVP2FBmjBEBIiyNREm/APkEuqEz1VerWnla7o9GTjtjVjM6ybzgg5YAn1rKSd
	Oo8dcSQktQO4/CTFczZfNjtWTvPawEQy7nWSgw2kn7dceVwYiPlBDbKFiuJHGfeDG4bWkq48wvF
	ergs2NlfHTxfG2CKgT8IU9juWF+smfXXuAxf0Zcye1WiJH6UC661IPVU4pgBYy2fa8P968GFm9G
	ZPRVFfJXTgrfqpKwpCEVpNHyP2XE8hBbIWiZb9rl5DSjPgZHRpUID+YiNSBasFwi
X-Received: by 2002:a05:600c:468f:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4b960d9b170mr35982125e9.5.1794164396406;
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1f3acsm185228445e9.14.2026.11.08.10.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Date: Sun, 8 Nov 2026 18:59:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-fsdevel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, Josef Bacik
 <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, Jeff Layton
 <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet
 <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Christoph
 Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados
 <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara
 <jack@suse.cz>, Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-um@lists.infradead.org,
 linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, ntfs3@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, coreteam@netfilter.org,
 kexec@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net,
 jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-mm@kvack.org, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, sparclinux@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-debuggers@vger.kernel.org, Chuck Lever
 <cel@kernel.org>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
Message-ID: <20261108185953.28054fb3@pumpkin>
In-Reply-To: <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
	<CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
	<20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 7 Nov 2026 10:48:35 +0100
Christian Brauner <brauner@kernel.org> wrote:

> > While at it, I think it would be good to use this conversion as an
> > opportunity to replace "char *" by "void *", which will probably let
> > you drop several casts from users.  
> 
> So I tried that too. The thing is it drops exactly one u8 * cast in
> ntfs3's label write. 

Since char is now unsigned that one isn't even needed...

David
