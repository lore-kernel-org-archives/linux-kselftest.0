Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531963;
	b=FhFN928I0Fy5wHgJTYWnMzY2SDAezrZGRpDjyRE5CL5fYHIkAz8tSgbartLbJ3ehVayD
	 Xmqj0CclfGETEGJjAYnco+sGzIlNPuM+DifWQ5un1/HoCqOg0NopLjjBTvvnTBx6VRmdT
	 gm1KGdGn8RY1ZbrIqy4UHTx8oLwvlfQQrsiJUFNvwcPG2olejkAyX1+2uKFdo/zcF6IQJ
	 aLc4Kod5gpqV6wwWzdWmgJ/rzS8C6qWItyyRaqk/tUf5w5YTnqGLXqRy700AdR0Txzo7b
	 g62WCmKB+brOgVf7f5UMwi3E81gcXXnE1P74OBnqlJZiqoTD46A3L5gRHrQU8XxQczg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531963;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=ZnAabwKB21Z82ZdBs3AF91RCBpmIzzYn4D2U8o5cGmM=;
	b=zdRQG9UoVeJlhhe5BYC486NaSsjUcFjY/qgDnkhMseJAoFFd8BTqtAGZfmsLC11gMe9N
	 bnYWU8KoAUGQ1wqmO6QznahboOIQtkHDyNkarcz0cgjriTsf8QZMWY8LAOgHiq+k0ezYf
	 1U1aP8gj/neLSvDN98soBlBfSs97Ok/9Q4rjfe18+5Ma6VvKo7F0fxqAU1lqEoqgtkg/x
	 kx79WdMnJ5dP9ZFKAWw89xO8i+z9DUa4y8uOrIw7OVWzNWH6hyMaDE0KKXqCd3khJWJq6
	 TwShp0t7ghhrVJTXXz5Ix/N63rBtsB5VkhxzrueGHYmxsXy42PcrUrqnLAabw5+1FXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=COQZmLOB;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ACF606A895
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 01:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45ACF606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=COQZmLOB
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso555829a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 17:06:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531962; x=1795136762;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZnAabwKB21Z82ZdBs3AF91RCBpmIzzYn4D2U8o5cGmM=;
        b=NKbnRcI5xgsDMdQdryijigfXW89Xo1VuRltqMmTSOS4xaPJwGpxll8moND5KtDRKtG
         eOLgOPKC2tAYP3xwWoqIzPVogJnujVh8HJ7b9yG1LlBzu0K5zAFrQzNUBdBT+VVOSLeh
         gJBENzQ4/oFWsn+QtTQ2cvj+gnM5hgxxeOmoYBqmazDEaE2QudV5+uZLOIkQb+id3rr+
         uCBM+HSNecamOJbVWMFuEFwS/AvVyNW7BeMPhcc59eMQhH+yxWSlKGFajFrsCf5Or4L6
         XDtaKvGjRG8TmrCJqRFnS8FlMAVPMx5U6kbkdcF5ZebKoJqE27zlU6g/OFWaTXs/Ub8S
         Cq2Q==
X-Forwarded-Encrypted: i=1; AL+hErFy4ags02YGYJmQvs4yGUCjbI+GwetVa06VXxSI4UEU+k5YcqDMtQK8S+DTo9ZKyrjRaBMODLkCPGL5XUTcfpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SkthQemBWnrs10saBk4rOhtzcDltnNc+34+ekxY2aoobjVcw9
	56Rlh4yooK/JeNwqEk86SqRv/Qhu/84SCN6TD1h6F9Idt8tKjzSSzL34fzdRVv46OgTjqlByBKa
	KfCOIiEAS2L9cskd8Y/bltbgNwmvrFI086A6p0S9ZcjnLyPfweoEwIHYaKP5Mx1oCmWuSIgiUah
	inafi2FL9LE7KbcdChtsTX/v1jhG70OJOtMDveMgQEAwzHz4HDkIT3t11zB7268qbzHzamssOS9
	3GxMlvl/mzYSgwxN/Gj
X-Gm-Gg: AYBFou30mcFyMeMLoye9aWtR/gT/8lfm9hSRkB0hp0ek3zmpBOkobRTg1v7JNm4e3ii
	uSTnvUIOn7Ygp9NTooDvh/ZC6eRe3fKC7dyFwZlA1eTPrxGHWPRcMEWSv42ACizILsdyFpC+lAi
	Wgkk85hFpctLS/Hhd7kFqKwemKYY+cqRRUEVm/WE2r2xE2eoKfw6tiJvM6TFAckNQs8QJHPz1xq
	R66DYmDp5/hDrB49buC+jiF8mPbtEETJBvAhLvR8LCflkY02RFe2QouEWTt2HOdIDiOYZn3IIT+
	bKvdvT4JcXCuIQNfw7OZNe1GnPabd213FFZCwgQ4x1aSR8vtC2YsPL9gPhh98y3IKmZYlrkKCAq
	mdacra50DJhkeODQQbOyUMKUJa4jXkJfHwP3S3bPXdqhBgt8+GkpLrgged/kDAyN38z+IPg9ch+
	bYykptWNeTMqXNkbrGG9nTAmP0dtgI8J/q
X-Received: by 2002:a17:90a:c88b:b0:3ac:6fcf:91d2 with SMTP id 98e67ed59e1d1-3b1b0b5b890mr734664a91.19.1794531962431;
        Thu, 12 Nov 2026 17:06:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197c1a3e7sm4323982a91.2.2026.11.12.17.06.01
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 17:06:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3adf57a6f70so1423821fa.3
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 17:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794531960; x=1795136760; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZnAabwKB21Z82ZdBs3AF91RCBpmIzzYn4D2U8o5cGmM=;
        b=COQZmLOBmcmEHdMPqvEP0EdMR2rvQ8bPtojPGo3l7MZca/exdIpW9rjXT3034sRQnh
         nobPBVHyXA8o5PoaQ/8zpcI7gTDlHkXk4fcisqQHMnlxOw2FNDmUca2yr5qylo3T3k60
         d/uyvkw76TxLH/VZDuqFIYXVEVGUQ0mT7A78c=
X-Forwarded-Encrypted: i=1; AL+hErHqNj6Gx+cA5kPRTqm/wTyml2O0Q+H2VKfAHfzTCKg2umhVb6DBAZd5vPwrbbFPjXWbJBpiuaF8JSiSLDtm60g=@vger.kernel.org
X-Received: by 2002:a2e:be9b:0:b0:3ac:ddd9:7820 with SMTP id 38308e7fff4ca-3ae2b66b124mr3691131fa.15.1794531959834;
        Thu, 12 Nov 2026 17:05:59 -0800 (PST)
X-Received: by 2002:a2e:be9b:0:b0:3ac:ddd9:7820 with SMTP id
 38308e7fff4ca-3ae2b66b124mr3690931fa.15.1794531959367; Thu, 12 Nov 2026
 17:05:59 -0800 (PST)
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
 <876c4f4fc442116c9bff8abd8c34f99fcfa65531.camel@infradead.org>
In-Reply-To: <876c4f4fc442116c9bff8abd8c34f99fcfa65531.camel@infradead.org>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 12 Nov 2026 20:05:45 -0500
X-Gm-Features: AclHuK980TpZ38DPslc648I2Dkoe93I0822BXY4bGJcbtvaJrKJwF33LG8JMJYE
Message-ID: <CABQX2QNd7DehBsH-pGL=EJK4b5vC60PymL_YP27xDxGT6_6=uQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] KVM: x86: Forward VMware hypercalls to userspace
To: David Woodhouse <dwmw2@infradead.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Paul Durrant <paul@xen.org>, 
	Xin Li <xin@zytor.com>, Francesco Lavra <flavra@baylibre.com>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Liran Alon <liran.alon@oracle.com>, Arbel Moshe <arbel.moshe@oracle.com>, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000008276b06601e0856"

--00000000000008276b06601e0856
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 3:25=E2=80=AFPM David Woodhouse <dwmw2@infradead.or=
g> wrote:
>
> On Wed, 2026-11-11 at 00:59 -0500, Zack Rusin wrote:
> >
> > +             /* KVM_EXIT_VMWARE */
> > +             struct kvm_vmware_exit {
> > +                     __u32 type;
> > +                     __u32 pad1;
> > +                     union {
> > +                             struct {
> > +                                     __u32 longmode;
> > +                                     __u32 cpl;
> > +                                     struct {
> > +                                             __u32 inject;
> > +                                             __u32 pad2;
> > +                                             __u32 vector;
> > +                                             __u32 error_code;
> > +                                             __u64 address;
>
> Perhaps add a few words more padding here?

Sure, I'll add some reserved space and require it to be zero on completion.

>
> > +                                     } exception;
> > +                             } hcall;
> > +                     };
> > +             } vmware;
> >
> ...
> > +Userspace may instead set ``exception.inject`` to one and request #UD,=
 #GP,
> > +or #PF.  #UD requires a zero error code and address.  #GP accepts an e=
rror
> > +code verbatim and requires a zero address.  #PF also accepts the error=
 code
> > +verbatim and uses ``address`` as CR2.  Userspace may dirty synchronize=
d REGS
> > +when requesting an exception, e.g. to preserve partial progress from a
> > +high-bandwidth backdoor transfer.  KVM applies the synchronized regist=
ers
> > +before queuing the exception.
>
> Does all that work as expected under FRED?

I can't say for sure because I haven't looked at or tried the proposed
KVM FRED support series yet. The completion doesn't build any delivery
state itself, it uses kvm_queue_exception{,_e}() and
kvm_inject_page_fault() with the #PF address as the exception payload,
so it depends on FRED support turning that payload into the event
data, as for KVM's own #PF injections (i.e. if the proposed kvm fred
support is complete I'd expect it to work, but that's just a guess :)
).

> I've added something slightly similar for Hyper-V hcalls in
> https://lore.kernel.org/all/20261111205836.4186584-3-dwmw2@infradead.org/
>
> I only know of a need to inject #UD, so it was a simple flag =E2=80=94 bu=
t I'm
> wondering if we should strive for some kind of consistency in the
> userspace API?
>
> And I wonder if the cleaner answer in both cases is just to give
> userspace a way to cancel the pending hypercall completion and use
> KVM_SET_VCPU_EVENTS instead of piling all this stuff into the hcall
> structs? It could even just be a KVM_VCPUEVENT_ flag to make it cancel
> the hypercall completion?

I agree that this would be cleaner, and if KVM grows such a flag,
VMware userspace could use it too.  But it's new API in
KVM_SET_VCPU_EVENTS, and we'd need to agree which completions it may
cancel: simply clearing the callback leaves pending I/O state behind
for PIO and MMIO, and KVM_EXIT_HYPERCALL also covers TDX completions
with different semantics.  So I'd rather not make this series depend
on it because it significantly increases its scope.

z

--00000000000008276b06601e0856
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIVIgYJKoZIhvcNAQcCoIIVEzCCFQ8CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghKPMIIGqDCCBJCgAwIBAgIQfofDCS7XZu8vIeKo0KeY9DANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNTNaFw0yOTA0MTkwMDAwMDBaMFIxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBS
NiBTTUlNRSBDQSAyMDIzMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAwjAEbSkPcSyn
26Zn9VtoE/xBvzYmNW29bW1pJZ7jrzKwPJm/GakCvy0IIgObMsx9bpFaq30X1kEJZnLUzuE1/hlc
hatYqyORVBeHlv5V0QRSXY4faR0dCkIhXhoGknZ2O0bUJithcN1IsEADNizZ1AJIaWsWbQ4tYEYj
ytEdvfkxz1WtX3SjtecZR+9wLJLt6HNa4sC//QKdjyfr/NhDCzYrdIzAssoXFnp4t+HcMyQTrj0r
pD8KkPj96sy9axzegLbzte7wgTHbWBeJGp0sKg7BAu+G0Rk6teO1yPd75arbCvfY/NaRRQHk6tmG
71gpLdB1ZhP9IcNYyeTKXIgfMh2tVK9DnXGaksYCyi6WisJa1Oa+poUroX2ESXO6o03lVxiA1xyf
G8lUzpUNZonGVrUjhG5+MdY16/6b0uKejZCLbgu6HLPvIyqdTb9XqF4XWWKu+OMDs/rWyQ64v3mv
Sa0te5Q5tchm4m9K0Pe9LlIKBk/gsgfaOHJDp4hYx4wocDr8DeCZe5d5wCFkxoGc1ckM8ZoMgpUc
4pgkQE5ShxYMmKbPvNRPa5YFzbFtcFn5RMr1Mju8gt8J0c+dxYco2hi7dEW391KKxGhv7MJBcc+0
x3FFTnmhU+5t6+CnkKMlrmzyaoeVryRTvOiH4FnTNHtVKUYDsCM0CLDdMNgoxgkCAwEAAaOCAX4w
ggF6MA4GA1UdDwEB/wQEAwIBhjBMBgNVHSUERTBDBggrBgEFBQcDAgYIKwYBBQUHAwQGCisGAQQB
gjcUAgIGCisGAQQBgjcKAwwGCisGAQQBgjcKAwQGCSsGAQQBgjcVBjASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBQAKTaeXHq6D68tUC3boCOFGLCgkjAfBgNVHSMEGDAWgBSubAWjkxPioufi
1xzWx/B/yGdToDB7BggrBgEFBQcBAQRvMG0wLgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9i
YWxzaWduLmNvbS9yb290cjYwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjYuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yNi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUAA4IC
AQCRkUdr1aIDRmkNI5jx5ggapGUThq0KcM2dzpMu314mJne8yKVXwzfKBtqbBjbUNMODnBkhvZcn
bHUStur2/nt1tP3ee8KyNhYxzv4DkI0NbV93JChXipfsan7YjdfEk5vI2Fq+wpbGALyyWBgfy79Y
IgbYWATB158tvEh5UO8kpGpjY95xv+070X3FYuGyeZyIvao26mN872FuxRxYhNLwGHIy38N9ASa1
Q3BTNKSrHrZngadofHglG5W3TMFR11JOEOAUHhUgpbVVvgCYgGA6dSX0y5z7k3rXVyjFOs7KBSXr
dJPKadpl4vqYphH7+P40nzBRcxJHrv5FeXlTrb+drjyXNjZSCmzfkOuCqPspBuJ7vab0/9oeNERg
nz6SLCjLKcDXbMbKcRXgNhFBlzN4OUBqieSBXk80w2Nzx12KvNj758WavxOsXIbX0Zxwo1h3uw75
AI2v8qwFWXNclO8qW2VXoq6kihWpeiuvDmFfSAwRLxwwIjgUuzG9SaQ+pOomuaC7QTKWMI0hL0b4
mEPq9GsPPQq1UmwkcYFJ/Z4I93DZuKcXmKMmuANTS6wxwIEw8Q5MQ6y9fbJxGEOgOgYL4QIqNULb
5CYPnt2LeiIiEnh8Uuh8tawqSjnR0h7Bv5q4mgo3L1Z9QQuexUntWD96t4o0q1jXWLyrpgP7Zcnu
CzCCBYMwggNroAMCAQICDkXmuwODM8OFZUjm/0VRMA0GCSqGSIb3DQEBDAUAMEwxIDAeBgNVBAsT
F0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpH
bG9iYWxTaWduMB4XDTE0MTIxMDAwMDAwMFoXDTM0MTIxMDAwMDAwMFowTDEgMB4GA1UECxMXR2xv
YmFsU2lnbiBSb290IENBIC0gUjYxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2Jh
bFNpZ24wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCVB+hzymb57BTKezz3DQjxtEUL
LIK0SMbrWzyug7hBkjMUpG9/6SrMxrCIa8W2idHGsv8UzlEUIexK3RtaxtaH7k06FQbtZGYLkoDK
RN5zlE7zp4l/T3hjCMgSUG1CZi9NuXkoTVIaihqAtxmBDn7EirxkTCEcQ2jXPTyKxbJm1ZCatzEG
xb7ibTIGph75ueuqo7i/voJjUNDwGInf5A959eqiHyrScC5757yTu21T4kh8jBAHOP9msndhfuDq
jDyqtKT285VKEgdt/Yyyic/QoGF3yFh0sNQjOvddOsqi250J3l1ELZDxgc1Xkvp+vFAEYzTfa5MY
vms2sjnkrCQ2t/DvthwTV5O23rL44oW3c6K4NapF8uCdNqFvVIrxclZuLojFUUJEFZTuo8U4lptO
TloLR/MGNkl3MLxxN+Wm7CEIdfzmYRY/d9XZkZeECmzUAk10wBTt/Tn7g/JeFKEEsAvp/u6P4W4L
sgizYWYJarEGOmWWWcDwNf3J2iiNGhGHcIEKqJp1HZ46hgUAntuA1iX53AWeJ1lMdjlb6vmlodiD
D9H/3zAR+YXPM0j1ym1kFCx6WE/TSwhJxZVkGmMOeT31s4zKWK2cQkV5bg6HGVxUsWW2v4yb3BPp
DW+4LtxnbsmLEbWEFIoAGXCDeZGXkdQaJ783HjIH2BRjPChMrwIDAQABo2MwYTAOBgNVHQ8BAf8E
BAMCAQYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUrmwFo5MT4qLn4tcc1sfwf8hnU6AwHwYD
VR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwDQYJKoZIhvcNAQEMBQADggIBAIMl7ejR/ZVS
zZ7ABKCRaeZc0ITe3K2iT+hHeNZlmKlbqDyHfAKK0W63FnPmX8BUmNV0vsHN4hGRrSMYPd3hckSW
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGWDCCBECg
AwIBAgIMYT8cPnonh1geNIT5MA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI0MTEyODA2NTUwOVoXDTI2MTEyOTA2NTUwOVowgaUxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEWMBQGA1UEChMNQlJPQURDT00gSU5DLjETMBEGA1UEAxMKWmFjayBSdXNpbjEmMCQGCSqG
SIb3DQEJARYXemFjay5ydXNpbkBicm9hZGNvbS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
ggEKAoIBAQCwQ8KpnuEwUOX0rOrLRj3vS0VImknKwshcmcfA9VtdEQhJHGDQoNjaBEFQHqLqn4Lf
hqEGUo+nKhz2uqGl2MtQFb8oG+yJPCFPgeSvbiRxmeOwSP0jrNADVKpYpy4UApPqS+UfVQXKbwbM
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
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIG3V
PCKqFzB7FPBZBnQdsMvQz886iMkzVEtppWyEB+Q+MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTExMzAxMDYwMFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAH3CyNZRYEQJPgicMqRfx6lBwhDLgB7Oh8OMMjsO
Ffo0+lop2yp2SEMPq6R1dneUi0FO/Fd5EsmzkfptZ1oNDRCOWy/fXErDa6687ijcQAZXG26aqcjw
VHTtbXRuNNcSOx+1AtA1mnNngwP7gPyIr7JJPriHZn6IuKSOHoEeqUfCMwije5KRKtwzFdUm/g73
fUUgb4PJLrQC5IkBDdMrDVA027iZac1jpco2KtyIAvcarFLGlf4ZzBIFoYE65YTTOlpY4RqT+5un
iJQPhYJPAkF1LqV/0Dd5edIWGIUf0OpeUbKGXH053Ja+PzO+KaiA0hhHJD8rw4V5gkvoio8wUlY=
--00000000000008276b06601e0856--
