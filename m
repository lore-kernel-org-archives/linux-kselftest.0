Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951899;
	b=ZiqIr6yLRnNEDjXTOkwdZB4RAZgY7zKRhTxSQXxtAPXefbdNSOTX3Ad0MPZkh/hubgdt
	 VDP6F34rxCIWwtIfmkEgGbmz2ShQ/2bzrk++Qth0wqkcD4TTkeX1PFwIugcHoLwBJ6+yz
	 7exurgQDp2FO4eW2fxo8cQuqCYJFJ7NivUH2FtB7rUMDwjxN5862DANp3SyNxC+nT+s2u
	 2PZE23Z8muD0OhiveFCq9F+Hl9TSCHpPwkuAScbeCjqu5O4MAO+CtA+pcC/aaYPhQEV2b
	 9Mwi1Cu0vrZMD5NKrD+YjMztYVje7DwyNYjBe0s+jNLK2WKFPWBP2uEW9QIoZLcZrcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951899;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=AVojiDahkXX/2c67q1pIjDAIQM578SSZ865I/yG/l+g=;
	b=wyVoQhJamSMz3uRpLzBl3n7H4yFLPiPEUgYxXmW309yEplN2Wsodtio9eDYQSQ+DgOSQ
	 FGoIZOh1nkjR7+QO0L4/ZwMFAJ9j3zbJF4TfPufHmShFh/IVaFaIfwBBW/Bt5gwI2Zbl2
	 Jvd2ZJJpNd8kPX08U0Heuh3TNiMZ3an1cF/3SBxBFDqsnXvtym0kKu/+MQbsrbfijJfEX
	 GsGda9ZdiXO4lFAjgZaZylxLxps5bRQfiJFMadwF1oM1WJ+Ykc07kTSHHADI8Cf2pj04U
	 FdqOfxwPCNyynSV0Lb0QrHA8Wb1k2cjfbu5ToQn5A63GfEhWBYhI24rfX/WfNaSWmMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=c38f+cnm;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C03606A32C
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 21:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36C03606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=c38f+cnm
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2e96502e447so2076685ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 13:44:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951898; x=1795556698;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVojiDahkXX/2c67q1pIjDAIQM578SSZ865I/yG/l+g=;
        b=l5Y9jFteB6NyhDfLqP481xid6+u4nZ40rXXd6iTE2egbuWbfGegyDoC03LjGhrhKA5
         s69elUo9rI8jACfqk3xtXCb+/zxWYZQmz/jW+BdH+IYS2d1PCHRjdjqwRme+sye/6e9k
         IHZgalE4k8Na+w3FCmMTmSZ1BOJ/bp3XOywP67+IOhJ6I2c7fLtR9zxTIBBR39a4ET3G
         ufoaawLNS3AYw3GEO1uQm7rbKP3XC+YNVLmMpyfKvS2f9uiSFIAYylbdkXNlBl9+nAAU
         AR4k04IYRYvDnCCgs1gdtq3l4rSna+7IYs2LPbfUUOR2LLzaPZuOtWYgBBJuCTF0e7VD
         M2DQ==
X-Forwarded-Encrypted: i=1; AL+hErGiIbzyOIMryz6mw0iANLUy0+kGrQf5T0vXsX2rHdQ0rh2RFBKoDRpH2SuAE+zQDw5MzKKnCsZ9xGUv0d8Lrhs=@vger.kernel.org
X-Gm-Message-State: APuU4Z++CyWd8XGWZ9hOoWjKy0+Pv8Ep0ZpzRHYMIOd+Y8urDrqjiqzm
	EpARM9n32PwShlw5oKwF6tnC/bw/rIWYnkJQcJlgEjxQXAhmIBiVr26+Q2/QWSpSCY5p+bWEa4m
	MKy0qw9zbgT2SfY6J5Wc0cxqL032zoTvS4ic4xioYywrWt75gOTmFgD88kfHPOsumyHV8Y7lkFh
	PJaZkrPsO2Amoeld4DobWXzAe3Ikt+/4PliVRl0duzUx1V0ediqU2Tk8KloZpE0HOcwnnyC8Qzs
	oyiWNtpDMqyy1h2jdCi
X-Gm-Gg: AZFdTZf5Y1Mju25j4eckONQQgTeb27ymzgx5wwov7XjRaIh2M9lnA0O3fK218edO09C
	cP6sh9F13Y202CV3N3VAb0Ih0/4BXOaZ9rUQYKLi1IBhx6AQZD4iYHQ22us/X9S4GjY32WWtS1P
	GkNT/7R6Ny9Q4IuoiL3LJdf7ZzenFU9P0FQGuKxLoVdU5e7RAlDwpVuSX7j2J5ZI30nAlesrf8+
	Ok7xQzSX7ChL5JCuIQujR+UUmy1EdJ5YhKnqIGkLRSSjlYXSMw+FgfKCluWc8o6zzab3/VKSew8
	eqkhKth+VVSV2f6j+VD3Iv9kW3DNYzuF/98FRSCwnmPXWTTvqOpiqa3TpjNesaNoOqCZxWf9ki8
	4xnyTjudzfcwnqf/uVMEzc7b7Pg78mQRFMNYDwAPIUid4/g7p1sD7lZfYR4zGn030QkFaRwqlg1
	qsWsthe1DYJm+iJRrTgKxBw+HEH/JvcIic
X-Received: by 2002:a17:902:e848:b0:2ef:e9db:6baa with SMTP id d9443c01a7336-2eff73fadeemr5353085ad.29.1794951898417;
        Tue, 17 Nov 2026 13:44:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2eff5ee1824sm250005ad.1.2026.11.17.13.44.57
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:44:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3acb2e2030fso1527641fa.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 13:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794951896; x=1795556696; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVojiDahkXX/2c67q1pIjDAIQM578SSZ865I/yG/l+g=;
        b=c38f+cnm+P0V81i+Cb90UyhaT/nafwCp3zLGnza/3rTvF4Tlhz4y8RJ2GvQrsTc4LH
         x849U+rqDUUqkUzwQy4Dd6Ze0dojOFyuuGnugHNPk8f6fiPxCayeRsoJ+rrm5V7dCAhD
         9JyqY/U/zeMgwwSu85bSAlXYScqqlazt2OyCg=
X-Forwarded-Encrypted: i=1; AL+hErEkrUpy4IhrWS35Yzw4nJbPgBT1mlpayqiovXRInPfFNvL124JzDIiiYOSMx/iPnmqyX2i+CvFBSNvHp6lC0nw=@vger.kernel.org
X-Received: by 2002:a05:6512:3ca7:b0:5bf:6c4c:62ce with SMTP id 2adb3069b0e04-5c1aa03d10cmr156153e87.55.1794951895841;
        Tue, 17 Nov 2026 13:44:55 -0800 (PST)
X-Received: by 2002:a05:6512:3ca7:b0:5bf:6c4c:62ce with SMTP id
 2adb3069b0e04-5c1aa03d10cmr156136e87.55.1794951895405; Tue, 17 Nov 2026
 13:44:55 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <90467782be23b83fd3e9a6afe2f1d2149eaf9db9.1794374897.git.zack.rusin@broadcom.com>
 <CALMp9eTF3WtzGGaV=sCYLqm=8oHNbqg2pYUr_qtcXJaAKjc9bQ@mail.gmail.com>
In-Reply-To: <CALMp9eTF3WtzGGaV=sCYLqm=8oHNbqg2pYUr_qtcXJaAKjc9bQ@mail.gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 17 Nov 2026 16:44:40 -0500
X-Gm-Features: AclHuK8Uus290_Q06_UE2bHYakRlG_bLEeTgE9DVUB1X6orAgAVuvkcOrMMolx4
Message-ID: <CABQX2QPMMORjW9y5DinfDJEw15hp0uDk48Xr9J9OcxUz_AC_Rw@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] KVM: x86: Forward VMware hypercalls to userspace
To: Jim Mattson <jmattson@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, Xin Li <xin@zytor.com>, 
	Francesco Lavra <flavra@baylibre.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000028389806607fcea6"

--00000000000028389806607fcea6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 1:53=E2=80=AFPM Jim Mattson <jmattson@google.com> w=
rote:
>
> On Tue, Nov 10, 2026 at 10:05=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.=
com> wrote:
> >
> > Add KVM_VMWARE_ENABLE_HYPERCALL.  When it is enabled, exit to userspace
> > with KVM_EXIT_VMWARE when an L1 vCPU executes VMCALL or VMMCALL with
> > VMware's magic value in EAX, and let userspace complete the call by
> > updating the guest's registers or by having KVM inject #UD, #GP or #PF.
>
> It's not clear to me if this paragraph implies that VMCALL and VMMCALL
> are supported cross-vendor. If so, it may not be true.
>
> In arch/x86/kvm/emulate.c, group7_rm0[1] (VMCALL) has the Priv flag
> set. When an AMD guest executes VMCALL at CPL > 0, x86_emulate_insn()
> sees Priv && cpl > 0 and injects #GP(0) before ever reaching
> em_hypercall(). The other direction should be fine, since
> group7_rm3[3] (VMMCALL) does not have the Priv flag set.
>
> In any case, if cross-vendor hypercall instructions are supposed to be
> supported, you should add them to the selftests.

I meant the native instruction only.  When the hypercall backdoor is
enabled, we advertise VMCALL to Intel guests and VMMCALL to AMD guests
in CPUID leaf 0x40000010, ECX.  You're right about #GP(0) for VMCALL
at CPL > 0 on AMD.  I'll clarify the commit message and API docs.

z

--00000000000028389806607fcea6
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
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIBAp
VjnktPh6sj4ZQQO7CMSeyzt3kkjQCCivmRraee4YMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTExNzIxNDQ1NlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAIXUD4TnI3Ls73aU5WfA3krQmb8uF1V101RQK3Jk
HPETb79pRmuzFnlKYulB16UsDTqtOHFFtmVJd/nI2xuDC5NSDnFiQHhyynUsTf2PmOYXKSAffJB0
rxoH+09RlJ6Hv4hsopO8c5DlSIDJBuJRWmWVSWyZ3FrInOg08FnozsFNJrfQuJdKwxroyosSi0y9
Q+QD+NgmH/hC09LTAVShijw/acv7+KWF8x7HM3p6Mn0p/pow5mmEATdYoYVFQhtnv38fmTJ9QKZb
zKVDqcP6N/2HHtK6Lnz2AGEbiaRsa8pJrL8tJxAJLdChdaBZY2froM/QS7jh4rfPTOx6Djg2hrQ=
--00000000000028389806607fcea6--
