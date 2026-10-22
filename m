Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792689559;
	b=ieeAM9lHKzdSa615noheUB3moJFe2pzEFTe9xEfUpJLdqvYQmDgv9FslbCKVAhtUGyks
	 AKCqy1mtuCG0DqzqHP1qy/f7MQUcxT75/rpXlFdcxUyCk1zSGVykVqU968cy3zrgbPmmP
	 i7Ve7h2w/f/SxI+IHVtdogj8+vitvJDI5pFSLAbOMQgfMkeL6aibI2vCpHRLtu29D4Key
	 SWlw0QQVT4HXwPbIq49AjuF0mNlkx/cfo988srbeyd2MCZYPsQPS1s3+FPtkkAmgpGsOK
	 NSdadlqb/esT1QBaws4as0EyDxfcvTFY48AdD7KOhYFfF3eNFVl2aSAAwy1maMdPTog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BB37ifua8Sxb2GAG5iG+mcuA1PmZC21b7zD8v0nAGJ4=;
	b=NGX/6kp6q1eg7vIxL+0kKoIzFEIU7rXWFmd5+X6dvm4d5N2Hq0ukyFsrJok2YAojXFhK
	 pg52Xp7QyT47IEJgi3YfBEaUsJpwBS8wg49s3lFyi5uILbjywVcikPfKHaku1OgdHjnpn
	 DDkLH9lkHImr2lKBHjoDtNSftRmR1ea+iuhoZvWXwUTjelNNZWoIpLUu6PWIAdSPFmWQF
	 7ErXd7uUOG4DJWyDQQGY9in3LiZD9D6PTWcr+c5BNRe5mQ2juxzoGUh3FovaPq/59zTLP
	 cLLo5r+wPRNHLAZjdNZbpTuzVjnLC8VOP6V7Xi6Hobn4kPXNMLEauRqw7CGJ3lSbW7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1659F606A31E
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 17:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1659F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ace9e6e1a5so661572a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 10:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792689553; cv=none;
        d=google.com; s=arc-20260327;
        b=pYpr4Sz0yxdAJlPBPJS+/4/OSuDmMyaCqRdDtp7zviaWq1m7XTsWvFXcQF4OvgWxtW
         0LbAiBXVzmSSk4ojYv0H+kMKoFmkhF09LvF9h1h/OtjPT52ALCzx5gMScZr0v/L+myPH
         yvCorxnSF0LfO0DB3doZnxC1oSj1qhFbJzGsNXSDSDCP/EH8bBDwYRsARdNvr9KmjQVi
         Sav8qm34uiVtMLnBVhrkSubHC6iACTUP/jAbPzh4t7zBe8L4c8Xn6ZeSkGw63j8Syl1d
         pCK5i5ngrQ/fh80IZec4GYykgRRP9yWBdPXqrRpXkvUFEV/e6cbd3D98XJfAjNocrCB3
         kpUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BB37ifua8Sxb2GAG5iG+mcuA1PmZC21b7zD8v0nAGJ4=;
        fh=OxHSwEBALWcFfTatnVR3TYEKjlJTbaZkXjKfSZS4cAo=;
        b=D5eDNE6AsW/Yc8SCP/uzWexBE+T+h/hzbsfBBHhrbolm78rpcPtp6vSiUsxxuXVEFr
         60xNaY5RoccfPmh5l8+ImcWxJw8GpVKVxs4FOYr/eWsW8zHX6dSrfmfwjDtXSLzkl88i
         V+qRBha+u3yZJ2pvyl2s1H44KO21eUAYE4ttpA16jtLstuyiUVi908vsg4dxowx8YaMG
         /K0BQoOyxBAD1EuTHb7Wf6IUwNeExjsvaJ2KD5WRT9aphXU0NIwtK6BoqrAGNXnTil9e
         AA68oEFVAHV8K94OBmLTaygGnfZLHFo23TSYvEXusPMfaYOcrKQmIyVfCRYwoLIlVfrQ
         ceqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1792689553; x=1793294353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BB37ifua8Sxb2GAG5iG+mcuA1PmZC21b7zD8v0nAGJ4=;
        b=K1eIq/GMjRwymTiDRmvQUK4W8vEF3J66M/qREU4Pf5Dgs5jQY47GYeuFACctzhxRMp
         JVIwSc1p02bUGb7HGwOYlEo5uZFib/eQJhSVsSgYR7CG9iocSGXDcq05KcghSCfYpgwy
         tSFcUsS2z/n7aHILMoQ1mkvzB+iyUr4GqW8+qaZVoW1HBBwoVccXepzOQGzfx8z+oMaH
         MbnLhZnhS7e1RtF7WDLLDAdCPSOMm7nw6oq6jiVMYt2JckrcBnH+P1DSoy230ddk83Y9
         MOjI5cf98eAf0w7/SJq4HQ1j/7yH97UuyWDx6nIWaLQ0m7oBxCg7jZCwsTT1NW/Pj+VT
         1VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689553; x=1793294353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BB37ifua8Sxb2GAG5iG+mcuA1PmZC21b7zD8v0nAGJ4=;
        b=k+lEkCT6UKq3XMrJmlyHee7r1f4tJgZMu+2Ex8X752UQO4s4zyRLVOOn0mrbiSxRzQ
         06r4GjDCisx8DMaV+UzVBPXlh8r5Lyy47V7eUE5HF+J5T36pZfebJEd6rLDk0ALOhuzX
         PgFKnw7MySOCm/+S8pAWZlwe5eyTsBgKi7PdvKWTkApv9QosdnApvSvgvKNwTkF0vf3z
         mwWUALi/VQiS65lvFKFn5tbuHlf1NApU3ESKb2HQe5UrGSuOc8ZfNVgR8/dmF3c/f2O4
         nMGH/X88YtsFsrOi1V2CIHsTeAh2MabYIxJmh1x1hHms7b0XlyhUTiIdyl+0hzj13Eu0
         25JQ==
X-Forwarded-Encrypted: i=1; AKwUvBykJlvmrhZ7WKcg4GplgiZwv1+H9VNS7k/dY8jtyEUOQ8E4vCzYkoOjnCJ9NVHJYpbPz9mTFOFogVDZJQNi4Fo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8BTkahV400aJAGukl2fXIzuVsYQgUYjNYLKNKZ+qRl4K6LKIu
	qURkasUoE/a4mYM6k7F6oOyUT5MmUx2jLBqqkOVMEDh3D+Y/wr1TR7LY/ZJLtEYO5N59jcOylJD
	5KBKtJzriEj2yi9CE3mDeABiwg8o21uJhhCmWn0ki
X-Gm-Gg: AYBFou3TNVx7uRDY2KWPdmumY+SVcc+TIUriCuLRAncivclENeI5RfyxF8FcyiDPCp9
	DEBYjyPnIUW+6gQ0nMrrgrx9bcNqUEUG0EEP0ZFVlgxh0qNe7SGNd2Cf2UrmPfigsD7LmuyH7BU
	KdCsqNBq/Plgji5JPsHsfd4+AtsJII+BV069UzwckZ7fq2Lm0BNitOakBhn8MtczvPyzX2jNAbC
	XVcZEqn9ZFKYB2tVpa8oFW6kKVFs8yvQFfhfxXfChLwTrTKhw/9iHtxfWxGAK2Pf2+YUJ3LtnGq
	pw0YHmfkaiGK9Mp4pSkNrx4pytWCER+41WO14/H3R+jAU5OgQnyRyWMSOwV5OrjCnxUNRYLjxqI
	BShJ3wGYRQ8ItnL6PBnFBM28b/8/e8G9NY9p+htkY8lS9J9V3CINPidmVVwHMUoHeqxTQ
X-Received: by 2002:a17:90b:514c:b0:3ac:95d7:2f95 with SMTP id
 98e67ed59e1d1-3ada6d24c14mr2208639a91.20.1792689553067; Thu, 22 Oct 2026
 10:19:13 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-b4-ipe-keyring-rfc-v1-0-156f0b93e843@nvidia.com>
 <20261019-b4-ipe-keyring-rfc-v1-1-156f0b93e843@nvidia.com>
 <702ade20-a2f3-4919-97e6-c72faa89399a@kernel.org> <20261021-groll-donnerstag-erfuhren-ce34a0ed4e97@brauner>
 <CAHC9VhTHUU0h9k74CMT6wYhMwyY3YhbSSFwJoDTvoFRyTFVZwg@mail.gmail.com> <20261022-hausbank-dozent-hurtig-9443f3777475@brauner>
In-Reply-To: <20261022-hausbank-dozent-hurtig-9443f3777475@brauner>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 22 Oct 2026 13:18:59 -0400
X-Gm-Features: AclHuK_mpvVbVbsjXsFY4C_2Z-Hg3ACXgqMxfwiNaJKHEvEnCJIfbBS66y6uEck
Message-ID: <CAHC9VhQ4sdCRvJ+YPZoiQzR_hgQN6-=84qvnTDDGPf=7=L9-jA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] ipe: add the .ipe policy keyring
To: Christian Brauner <brauner@kernel.org>
Cc: Fan Wu <wufan@kernel.org>, Manuel Huber <manuelh@nvidia.com>, 
	David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Andrew Halaney <andrew@amutable.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, linux-security-module@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 6:19=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
> On Wed, Oct 21, 2026 at 12:51:35PM -0400, Paul Moore wrote:
>

...

> > As far as I'm concerned the decision of how IPE uses an IPE keyring is
> > up to Fan.
>
> This is really not an argument. Manuel posted an RFC that follows two
> existing in-tree keyrings to the letter. Fan asked to deviate from them.
> I explained what that costs.

I felt it was important to show some support for Fan, especially as
your comments came across (at least to me) as particularly harsh.  The
strong reactions in your latest comment only served to underscore my
concern.

> > Of course, fitting in with existing norms is important,
> > but if it causes IPE or existing IPE uses a lot of pain, that can a
> > good reason to diverge from those solutions.
>
> Which pain?

As I said before, (emphasis now added for claification) "... *if* it
causes IPE or existing IPE uses a lot of pain ...".  I intentionally
did not make a claim either way.  Once again, I wanted to provide Fan
some support in case there was an issue and he found himself in a
position where he had to push back to preserve IPE's model.

I think we can all agree that upstream kernel development can be
difficult at times, and not just because of the technical challenges.
Working in the security/ space also carries its own struggles beyond
that.  It has been my experience that having someone stand up and show
support can sometimes help make that a little bit easier.

> > These days everyone is
> > going to implement whatever they please, but if you have
> > needs/requirements about how you want things to behave in LSM land, I
> > think it would be helpful to engage with us before you make a decision
> > and then start pleading with the LSM folks to adopt your approach.
>
> I'm not pleading with anyone.

Perhaps that was not your intent, but that is how I read your "Please
don't start breaking an established pattern that works well." comment.
I believe that is a reasonable interpretation.

> And the engagement you're asking for happened. You just didn't engage:
>
> - You read Daniel's bpf keyring series yourself in August, Cc'd the
>   keyring folks "for obvious reasons", and had nothing to say about
>   the model. The cover letter spelled out in detail that systemd would
>   provision that keyring the same way as .dm-verity.
>
> - On 2026-10-11 Manuel announced in the KEY_SPEC thread that he'd
>   propose a .ipe keyring "modeled after the .dm-verity keyring" after
>   "initial discussions with Fan Wu". You and linux-security-module
>   were on Cc.

... and you are seeing the engagement now.

> As for "everyone is going to implement whatever they please"... In May
> you told the bpf folks that "we just need to be willing to accept that
> we have different needs and show a willingness to accept different
> solutions as a result" [1]. I don't see why that shouldn't apply to
> systemd using BPF LSM.

I'm unclear on your comments above.  Obviously out-of-kernel-tree BPF
LSM code is free to implement whatever it wants within the bounds of
the BPF constraints/APIs, that was the intent behind my "implement
whatever they please" comment.  I guess I could have made it more
clear, but it didn't occur to me that this would be a controversial
statement since it is already happening today ... ?

> Frankly, I couldn't care less whether IPE chooses to model the keyring
> the same way.

That wasn't clear from your earlier comments, especially considering
your tone, but it's good to have that understanding now.

> I'm confused why you have to speak for Fu and why you're so
> defensive about this.

As mentioned above, I wasn't speaking for Fan, I was speaking in
support of Fan ("... the decision of how IPE uses an IPE keyring is up
to Fan.").  Perhaps you didn't intend your comments to be received as
overly harsh, but in my opinion they had the hallmarks of anti-LSM
bullying that I've seen far too much of over the years and I wanted
Fan to know that at least he had my support to make whatever decision
he felt was necessary.

--=20
paul-moore.com
