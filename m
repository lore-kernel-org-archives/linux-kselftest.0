Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B57235BDA4
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 14:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668344; cv=none; b=pryErgsmb6vy5Ll+211quMAdoepri7gLZumRFTOFeW3h6uAtPydSlLHTSx6kLIOHchN4PiiSFiMajSB7fQlppscLfOeOnbmOwqrxe2Qxoix5iWLqsFumgPC7EfqqWnYM+kmq9If43d9LGKqfYRrXNDiILZkMEmcWAHysxAwbSAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668344; c=relaxed/simple;
	bh=Naw+0pM5jX8sriiCIMcNpVykYT6UQjT0Lv2jeaVucUI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fG7MsK74fuxkRHiHodJp6xOcMAgD5iGzwCGqxys0LaeQiI+MDdFp2s/cs61p2Yp7hCTADk7+LPeIrrLGJxTNHOlmNnw1wVVnbaMde8mcw2IsMBkFw21S8kI//TSXRH+4s58n8l3HR1B2jtVOLSn5EtCHZv+qQiH9IYbRP/7LdvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b9zbpl2t; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b9zbpl2t"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490a76757e5so13549555e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 07:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780668339; x=1781273139; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nQz8xMZ+YvTuLBSXCkopz10mbJB9XgtGAZm9roBwzQY=;
        b=b9zbpl2tLm00S63ACK7M8lQihpmryW9W4couUWY23dBetK6cUVcTQDcQXAXvr5FRFb
         A1/HL6lPn27T2rCK94iQ16VgGWkpHbZ0A0WMKNrEdS0+6PouwptpLMY8lXcBgshoGTrO
         I6e+kOlLyItdYdm0oDpQ1v1qDEEo23BFjw3dvC5SOfKTBX1NN+L+RkaYEYn9Jay27ikW
         crmkroynpgNzaARtDkeEAyq1ECi6d7OnpOVdo/QvJhE2oVYauXffMTkmO1JxEoGvewkk
         +98BeTfhrYjz7V96Yx2JJscQ833WQyyClC1oFOapxUpDcgIRqY6WhW4/1W0NvbalYcgL
         qQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780668339; x=1781273139;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQz8xMZ+YvTuLBSXCkopz10mbJB9XgtGAZm9roBwzQY=;
        b=q1fwdCyDElcD3M57+2wYyFTvkY/eUKHKFwCZpoKNDg36P6Ufr9bH7sU+xC/IbzqLKP
         arKiWF7IjE1rnmUXKPpM4XkPOunAR5nv5QjAthX4eD0J5K3iJq2Rlx3bD1KB8d0zpj6F
         N9pKfqpyFzDdNAHjJxmre6ErRXoL3XiEKECL/g4ZZdFYHZ1Gyk5T31iD1wf/yXRenscO
         oLgh+EX2zIe6F0pU6g0CVtAsNeJMZsIcRRlS3ufy8FYcqT1Dhkj0zlO/1fjVi8bv/ttR
         dbM7PKXFpWjjfKSXWythagUmIAbe+R5UwFLe6maXSjNYkfh5K6MHLFDN2eDic/vyAZDO
         7Dlw==
X-Forwarded-Encrypted: i=1; AFNElJ/ndP2PRE1itOneJi0FUV46SvIPWL28+RyH60iwW/5oFBpoX6JXAR54y4nzr2u2URy04mtikNzOWgi56GfAxDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWvAcOcrRP5tHDHX3WSDGteoN8//iR9HgjtU4uf7S97Mjpstba
	QNZgMSvB8ae71SddMp0TEQNm4hFZfZjxxzHZd49zjvtzZSQcfRchuD5QKg/r1zPqwt0=
X-Gm-Gg: Acq92OFT1HZUQbLULifVdSwFSaGCHEkAMqkYTi/eovr1ZmwtVy6QD21AID79YNUmeFk
	FQlL9bHWwlXq0sa6kH5WnojUJaRi7q6Q6T9tsrxD0zSSobFUtCJFZPNyRuHxandZl/4QYE61Wwf
	guAuOkIadl684ORumX2qcbNJil1r4IXVuiyP5CH93b7PndkkgTG7OVVrL+NwLge1v4QdT8yUHVY
	Gckp8nxUzmSPgxJe/VJJlgy7B7R2jQFPDFPVSXCgG3MJuyeGSuoLEqTIPlu9IRqaUlka+FsIRA+
	Z901tPOlI1cZHk+EhBioTcOT9D97x3CC/21Neocj2QO94fhafkqRIGIieHTwdtU/ovDL7sLAgJ1
	DkNp28NLmpIYTFNHiOnDBu12mTWaoEcTE4OaXm46dZtoXLeDDKeE/sBi3xr6SmBSdg/zpcpMH9l
	sp5W3oC5EtEQpeQMsJex3paPKJVJhPSWxDl9LEyv+52smpcoi+dmnNEUTYOuakYeGoIqiAZKA5B
	46zDq1t6iU=
X-Received: by 2002:a05:600c:6094:b0:490:4b89:5362 with SMTP id 5b1f17b1804b1-490c2609cecmr59481725e9.24.1780668339022;
        Fri, 05 Jun 2026 07:05:39 -0700 (PDT)
Received: from ?IPv6:2804:1bc4:803a:4c00:6a4d:bd81:dde2:ff59? ([2804:1bc4:803a:4c00:6a4d:bd81:dde2:ff59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm138093265e9.4.2026.06.05.07.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 07:05:38 -0700 (PDT)
Message-ID: <0f269520407c8cfc554059ffcba45ef3220ecfea.camel@suse.com>
Subject: Re: [PATCH 3/4] selftests: livepatch: Adapt mod_target module to
 pass on 4.12 kernels
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: sashiko-reviews@lists.linux.dev, Miroslav Benes <mbenes@suse.cz>, Shuah
 Khan <shuah@kernel.org>, Petr Mladek <pmladek@suse.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>,  Joe Lawrence <joe.lawrence@redhat.com>, Jiri Kosina
 <jikos@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 05 Jun 2026 11:05:32 -0300
In-Reply-To: <20260525002416.3B3A41F000E9@smtp.kernel.org>
References: <20260524-livepatch-unload-on-fail-v1-3-7465de7f741d@suse.com>
	 <20260525002416.3B3A41F000E9@smtp.kernel.org>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-05-25 at 00:24 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [Medium] The `test_klp_mod_target_ops` structure omits the
> logically required `.set` callback, exposing the kernel to a NULL
> pointer dereference during module load.
> --
>=20
> commit 532c1b8c7438f534fd4e3440716ede6cf83efe1c
> Author: Marcos Paulo de Souza <mpdesouza@suse.com>
>=20
> selftests: livepatch: Adapt mod_target module to pass on 4.12 kernels
>=20
> Use the stable module_param_cb API instead of proc_fs for exposing
> module
> state. This approach is compatible with kernel 4.12 and later.
>=20
> > diff --git
> > a/tools/testing/selftests/livepatch/test_modules/test_klp_mod_targe
> > t.c
> > b/tools/testing/selftests/livepatch/test_modules/test_klp_mod_targe
> > t.c
> > index 9643984d24022..1382a266825fb 100644
> > ---
> > a/tools/testing/selftests/livepatch/test_modules/test_klp_mod_targe
> > t.c
> > +++
> > b/tools/testing/selftests/livepatch/test_modules/test_klp_mod_targe
> > t.c
> > @@ -5,31 +5,29 @@
> [ ... ]
> > +static const struct kernel_param_ops test_klp_mod_target_ops =3D {
> > +	.get =3D test_klp_mod_target_get,
> > +};
> > +
> > +module_param_cb(klp_mod_arg, &test_klp_mod_target_ops, NULL,
> > 0444);
>=20
> [Severity: Medium]
> Does this code need a .set callback in the kernel_param_ops
> structure?
>=20
> When a module parameter is passed during module load, the kernel
> parses the
> arguments using parse_args(), which invokes parse_one() in
> kernel/params.c.
> Because parse_one() unconditionally executes the .set callback
> without
> verifying if it is actually defined, omitting it here leaves the
> callback
> implicitly initialized to NULL.
>=20
> Could this lead to a NULL pointer dereference and a kernel panic if
> someone
> attempts to set this parameter during module load?

Indeed! I'll send a v2 addressing the missing argument. Thanks Sachiko
for spotting it :)

