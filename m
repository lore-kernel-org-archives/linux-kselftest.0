Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952222;
	b=DPG+2ZIymmsFHnWtYKXaZBT62zrDgNMCBVPHMPIOFqQAHGi8l8S4euLKkhi+hO+kl3Sr
	 44oJ4m58tPh41cF+c9e4tKMgm2/sfFvtw86CevtGhvSsXPsvZDZMNRbZFGO//bkltfvV5
	 uuNRYz7ZcxeFURhdN4yEZtE5xnn4OY3YcFOnc6EkPdyKAnuBWSCPR6KAdhp4q0sxI6Q0K
	 v7+jykXIPl/vkAWTE+hxU+SFqFnxCIccbr6DwXj8w4UHMX+UMg0iPnYkN/kh5PJlp7EdM
	 oROm9kkNdeLtvxhWHCTiEAI165xM/ONXMRuRpqCpgIN+VAtALLZ+LGE4cXGzhpte8Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952222;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=mTlwzWrhUbWj/qgAqAFgB93uMRLrXiAOahdGgeN7h/I=;
	b=3T71E8ARdoPo7a95FnREraKqFGCGlOM53qyXerAr8bIGDn1/4wbV2WMATpphvwfnTlZn
	 zNTOeiLD1DRmnDS3Wc9nO5S/i2IBxm3vsC9bEOq0Xjqhg/QTErf+8UAyToDwsDXDVG4PJ
	 oIE3058Wj3Rbkxuv9fvrvx1LccDQ/3vuM/ES3cRCul5kDfOmSE85DHZhI5foo8HyIR5dq
	 hhpbRXtnhZLpG7EH5ghMQYEKgKDPS3vUycu+aA57ZngrS/WvIFnmeJQW0Xw1tCyPxL9L2
	 hWEm6J4oabciolxUeZMWR/dv9v04311Gv3zzRNrrWYMs9hPX4ALPVHl6HHz+gbt8zFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Up82NMnA;
	arc=none smtp.remote-ip=209.85.160.226
Received: from mail-qt1-f226.google.com (mail-qt1-f226.google.com [209.85.160.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7C7606A32F
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 21:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD7C7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Up82NMnA
Received: by mail-qt1-f226.google.com with SMTP id d75a77b69052e-55c35262674so2274341cf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 13:50:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952220; x=1795557020;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mTlwzWrhUbWj/qgAqAFgB93uMRLrXiAOahdGgeN7h/I=;
        b=gkYFmnoOZ1WH66TRdJl55egA7MV4GBzXnjlxalgBCVOIaHHPx5d3vmSsjlTy1FjOhf
         4wCG5YJwFB6GF3FrNjQ10gYA/5+7yifSDuT9Z3WufK6fUerxhrs53G59cyTiVYn65fj4
         R8HkjoS/Z9si+gfq8lg0dKVyHf8JIQHAgsi1Y8Js1r0zrUAit7+W/S3o3jdmQgpQSXvr
         27VXyGru+Xdnj4MtuqDDMoCtlKMGKB71blCezEVsQNtvIqUUyTQf2nJmoHlxXrGe0/cu
         opq3V7/DmNcMcPDWzdqz5hvbmgmArkV80sWVCuLyWF4QHAWkR8Wp3XGYur5Zcos9phuT
         P31Q==
X-Forwarded-Encrypted: i=1; AL+hErH7uVi7W8cJXxv8tRv8aENZ2mYsxX8xq3ys6RceDalDSif12+CS5YWeB3a2kPTktke74P9Aj/M4dzXiz1afv4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NL1OlXiOwHpGAqOOw+ZcAWfLdiXJKTgzRVuZmxIkCweQBYLBa
	q8NPCZq3HUC4y7V0SA3dJ7LsRJJBc+OvU/jndGFB200hIDqhK/9DXM2XYnbs7KtlhhV0PcLE9yP
	Nt0ax35ZBm9Dk07ik8V4NUrPhVhEr0kpDIT2eMF3NLd9FGKYU8rI6kT5PYuXW2qmwxYeLSElzoQ
	ZPKlYJowJTw0ZxgmxRpQZ9NdxF80owYkB7d+fE5p/J9T6Jy+ShUbKFMzrKaTkV/OrcdRc9a0KPL
	t49AmkigLt3oRKNdRk+
X-Gm-Gg: AYBFou3K8yXT65xOyYvfyHYzTm88ntN0K4hivunSv6w71uHfaPOYOnkcOL2tii7Tc8r
	u9G7V+Qn31BOhI3mWDEpmu3DfWxd0OJvfrdJ8g6ZSCObsYKW0yyLukQtZY47l5XWttQ+UqQvhzU
	LxaCYWWcXoT4s+N5STBFlkSoJGh7OORdhWc4o0pmg6o9UCIAnl++6E7s6mg2UAVNIQQe/EEn52u
	hbvvhljqMJDn8yzi7kutagjIzIqcmP4lkwRYPNstFNIF9mZYScARVF58zH0h9MdgkQSY/FFYWRh
	L+8UM5IGi+fnmJ2QDkP0IWlJhQHEbNRUH1e/Dq9RbALWH36soqxYgidGxruQd5YF1WpU3s+Aeoq
	IBP6CIo9e3wORhmCCdp938bMuk8wZPx01rxmOeYjmhC1WiqCU9nzAwuE0wJSgP6jl2z5UOMUDcO
	1tqhU0i7mimRnlYGQhyHd/38xv6RREx9Rf
X-Received: by 2002:a05:622a:4186:b0:55d:13c7:c232 with SMTP id d75a77b69052e-55d5a679a66mr9617771cf.51.1794952219397;
        Tue, 17 Nov 2026 13:50:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-92114e029c0sm101556d6.13.2026.11.17.13.50.18
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:50:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3adfcaea19aso2019201fa.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 13:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794952217; x=1795557017; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mTlwzWrhUbWj/qgAqAFgB93uMRLrXiAOahdGgeN7h/I=;
        b=Up82NMnA0EjMJTQbLeR7Z7kOb2j6+Sr4tV6VYrNQPqi3Wxs13fsSjGMYF0Pv359gAK
         kmNSyXU3Xc8K4zn4WS5R8s1tsOwxjJ4GzIwgIVGN1BzGuIPOxFUwNWtsvd+bmGH9w/pZ
         1Pv8TaAT+UDsffcfbE4FEen0BCuS1VbC9NbS4=
X-Forwarded-Encrypted: i=1; AL+hErGIQMnQ3+C39I+dwwGkaIBcXq1OnJ0DP1CvWGbUvIwhE53TSwQWCYcWnHyQd/zZPY1hGt2XVKR6tW7hMs97g6Y=@vger.kernel.org
X-Received: by 2002:a05:651c:1615:b0:3aa:f42a:b78 with SMTP id 38308e7fff4ca-3ae671e58ddmr1423411fa.20.1794952217390;
        Tue, 17 Nov 2026 13:50:17 -0800 (PST)
X-Received: by 2002:a05:651c:1615:b0:3aa:f42a:b78 with SMTP id
 38308e7fff4ca-3ae671e58ddmr1423141fa.20.1794952216895; Tue, 17 Nov 2026
 13:50:16 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <4dca09deb85d2d5db157888ae4a2de7cbf6421d2.1794374897.git.zack.rusin@broadcom.com>
 <CALMp9eSARNY=K-bXSoV6sBBaWoKQGHtym1VrjnHtBQhFvsb2gQ@mail.gmail.com>
In-Reply-To: <CALMp9eSARNY=K-bXSoV6sBBaWoKQGHtym1VrjnHtBQhFvsb2gQ@mail.gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 17 Nov 2026 16:50:03 -0500
X-Gm-Features: AclHuK807et2ZoWk0xCaxLbuvndRbqzO3WiuIVD3kOgv5LnNqlCtYteaCfGFLgE
Message-ID: <CABQX2QNy0nZJtvJJdBTrKTTZB=gYpRGpy6Gmx=NF8mGc40b_wA@mail.gmail.com>
Subject: Re: [PATCH v3 09/12] KVM: selftests: Port VMware backdoor coverage
To: Jim Mattson <jmattson@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, Xin Li <xin@zytor.com>, 
	Francesco Lavra <flavra@baylibre.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Liran Alon <liran.alon@oracle.com>, Arbel Moshe <arbel.moshe@oracle.com>, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000054e2da06607fe1d0"

--00000000000054e2da06607fe1d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 1:37=E2=80=AFPM 'Jim Mattson' via
BCM-KERNEL-FEEDBACK-LIST,PDL
<bcm-kernel-feedback-list.pdl@broadcom.com> wrote:
>
> On Tue, Nov 10, 2026 at 10:08=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.=
com> wrote:
> >
> > Add vmware_backdoor_test, adapted from KVM-unit-tests' vmware_backdoors
> > test.  From CPL3, with CR4.PCE clear and no I/O permission bitmap in
> > the TSS, read the VMware pseudo-PMCs with RDPMC and issue backdoor
> > commands on the backdoor port with IN.  Verify that the pseudo-PMC
> > reads succeed and the port accesses exit to userspace only when the
> > backdoor is enabled and raise #GP otherwise, and that other PMC indices
> > and ports always raise #GP.  Repeat the pseudo-PMC checks at CPL3 with
> > CR4.PCE set and at CPL0, where RDPMC doesn't fault before KVM handles
> > it.  Skip the pseudo-PMC checks if KVM doesn't virtualize a PMU, as KVM
> > then injects #GP for every RDPMC.
> >
> > Run the checks for a VM that relies on the enable_vmware_backdoor
> > default and for a VM that enables KVM_VMWARE_ENABLE_BACKDOOR, and
> > verify that KVM_CAP_X86_VMWARE rejects every flag it doesn't report.
> > KVM-unit-tests can only cover the module parameter, which applies to
> > every VM, while the selftest also covers the per-VM capability.
> >
> > Suggested-by: Sean Christopherson <seanjc@google.com>
> > Link: https://lore.kernel.org/r/aIEoNpe-LFoH6LBm@google.com
> > Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> > ---
>
> [ ... ]
>
> > +static struct insn_result guest_inl(u16 port, u32 command)
> > +{
> > +       struct insn_result result;
> > +       unsigned long rax =3D VMPORT_DEFAULT_RETVAL;
>
> Shouldn't %rax be VMWARE_MAGIC?

Yes, good catch! Thanks. The KUT test loads the magic value there and
I must have lost in the port. KVMs L1 backdoor only looks at the port,
which is why the test was passing, but I'll fix in the next version.
Again, thanks for looking at this.

z

--00000000000054e2da06607fe1d0
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIFLx
Tb9m7nzsimqC6t0kgAYV36Amc4ovvGqgrnqQl1p9MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTExNzIxNTAxN1owXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAHM91zEWWnY5VLC5Doy35uNLiZ/k6T7oZHP4P8VU
e5zc1DykZUQR1b/E6QeO3N4l/O1eabDpZR62VQax+GpMVqtxW2ES3JWwsm8OYOaTChLrSd4cFXV6
62JQSDkqezRlHByvyfN6/zjeVqu/buQm2umIRSLTbkA9eerjIfojQo5H1RWoAhcuCpxIBIpaLMR7
oYW6LlraANm5abpahCf13i9R+KhuzxJ+x68gwMmF7GvLsznbf/FseUcBxdezo7w/SsA+OEI8BRVB
6n8JvtgUxt931L0ktFpoMp039ZE2B8CKUHDep2WEL9Ha1c5X0UYunPPV7u5HOHfKRHs9h00E5Tg=
--00000000000054e2da06607fe1d0--
