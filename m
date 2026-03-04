Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64B933688A
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 00:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772584634; cv=pass; b=Lrcj6f00JwW5/tFgWWEzQR1NR3CItejjfIkAsQ21JCVHDBZgit1yb7d0n3+sF9t5/5uK4IyuK0m33O2xOaKN3CTxE6aE9HaSECXl7AuNJiUjO7p4tjN15P3DRoRKGeBd2B2wzuKNpvY7ht3C/W0s7KA/8LntGf7vVreU1GDNDNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772584634; c=relaxed/simple;
	bh=M6yXY28eT/NPSOXtoeWobinqZuHIfZPk3axLOzNW8iM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSvM0UwAeVuh3Bhb0V9LX8gXQtI7PYG3h6ZehAMA/RFRfyDwr0KdghMaUBdBGZ4CuAwmx6TKkjqw7PWJLkOCE+PXyOhNrGXIKeiuW92veNWmkOAJeLurPPE0acJkL+FQPNE0KotCN4S1czNQ2a+5/oIQGPPeKrlZ7pMcJcU1Iq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h47OWWuv; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h47OWWuv"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439c4a93841so536527f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Mar 2026 16:37:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772584630; cv=none;
        d=google.com; s=arc-20240605;
        b=jy7TinrP+WQLYylS8u64izr6U63bPfeBepCTOEceG6R/tv4kkaZc7HCcFtZy1RCDFS
         pedvNh77jkMh4pWqJpu+XR8cp3WlwLysrYUtToaOpDX0U3oSEpV+pf5l1O93+COESmwJ
         vGUKNP9Mh7eusL7AtkVXeZQqxzZLDw15cgsO5dWxiRd4t60trHRzhIFoeSeCWaq1RhNe
         xa+vMIqK78TFzHnggpsNinQgMVmS843EXsAFMFYNIAW9syELCJFfOzDPXmfPH3+UOo8r
         dhqrVBBEiAtpbXkOmFA8sSDsNPvwJAo7iK1+EsnhNSv9yoM/NGSxLy1g0Q+2RgXsFdnG
         T4Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HjSTBkZmlHgWHXmWcu1dYSmftEDtdRC7tlAMRxF3WPs=;
        fh=fefjTY6OX9ojN72UPQe+fQwtMpkgc65v7F/McFZOFXI=;
        b=is/E4wC96oClAG7Cllk9VcCRRhP93O+oxbmIMx4SFKcB2VyCD8dMEpWA0BF5alLfCk
         NulBpGF9VBkAV8BoIR/HnQ+ZqLvH+l93gOivNJJlFfiYaXzWweEfbM0JETJqcX9uZDcy
         4jOSihthGZomxU5s9+30Ri3Ra0ByXr45OY55yZhqS7azEC+9s3XOtkh4m5ulFw4gC7OA
         8cTMEhirj1yTP5GbXcv3FUtvctXt05ZOr6kJ0/EckkBeuDPawliV+Gy85N0mPIgNjNzv
         RSnk9wYHGtPSnmiHk3nq8k45/J9gMkFs9foUEGijgSun+rY3hB8CSERBU3P+d9O6sdsX
         WCrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772584630; x=1773189430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjSTBkZmlHgWHXmWcu1dYSmftEDtdRC7tlAMRxF3WPs=;
        b=h47OWWuvdvoackdwkbcSkHOrVKu0cSBfmZYwiiTMkYVDFC6IRofVTuru+c4EOjkgqv
         +mPCtb0aW++G8nC2hW+oJozU8SBEL39x7FaIa0MyFy3NLieX+nwbmq+UEk29a1K1Ao1s
         dTfteZoQltgpx+H4nWdUvaq22ijuHrwf+N+icOMKwSG2xgvJwcfA73sB8pOdAkBiWpPY
         o97S01z5dYX7u0qTJcsRymxhkwtYddEhtYEqIuHxAOJ+3hfBY3JbaSeR6T/81s760HEH
         oyuBjfVO3nQX92G8QdJzDlB5NV/r9UrbuQZ+q0BC/YyPHzw4XO6SeMXWa/+dy4wjAjzc
         I5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772584630; x=1773189430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HjSTBkZmlHgWHXmWcu1dYSmftEDtdRC7tlAMRxF3WPs=;
        b=BmqstZD9R1Kdk7DMUZlMUDp4yKRo6DS3XhPsBxzb8CZCS0ZyzfJjn5OiaRYgND5sAI
         +tNV71N8VHqO02eJWgWqRiJrSuVXjJ7euaN7Sjbz1F0XNC4mW9V6XBB2V3o66Wyy7GK6
         ASnlWG8r7MqaXqGCSyxgWarGrcSAusiGzxLHeKi91ANb0lVmeBUjvNa8S9sYJrk8txzn
         msOFeOMwJZf6Fnm9l1mJGx2iq9QiI8RHMtIyhmSTF1Vy4xajPZhxRiDsaLtboDwJxi+0
         oaUle9JOQ9oTyCTy8HvNmgfUr9PIhb03hHVd04Kg2hGo6zZM8I19MLIm/xqqgsYw1p/K
         3RnQ==
X-Forwarded-Encrypted: i=1; AJvYcCURhGuTER442i22b3vQNoUqQUzqPaVZTUmQPQwwWpRnvbFMrA3dRuHaTxyZ01A/oers8tYtRxmqPfSRrW8X5KY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUJQjC7Df0Y8OBKnMXy9giR4MpgnBeQ3PB4IieTVx+pgWEC+Cp
	ElrRRKQEB2z6n34G9JPoh81szCF51M7Z6r+/+dRcQk/UoMi7n92QBA6601Vpn+6PfP0eZcTSpje
	7sUN3DP2LDCW3Ngw9ifRnVdiR+jZvLUo=
X-Gm-Gg: ATEYQzxPMxLq7qVUdzVPnBWkoaQ8DJrse5oNB470rQcmcUuXNck4pJ6wiwGmSbGPjKv
	kA20S4ro5dCmkWE3myFWPYVGJpuBQu/Wt6ZiCBGXzdMoxI40oegkCClHfCZovo/7/hckyk/fE0p
	0L1kdwlBnE1Eh8lWG6JSxysvkDR+b2l/tKyiy9+/a86PfSwbgoMPnPCp/mb3InuH218sL1xUaPh
	I6st3v4n86DHpGuM1MemX7qvVRWwkDU6GAlxh9X7hs0deSyUKhY3rAg70PDo+3XcoTA2cqNj370
	8tIYQUW4CEB+4kKbgcul0oGmGRTBjmwONZqM3HJYcWHbDtNBdwX33Sru+JW6HjQ1w0lgGn0jnU+
	NRXPT/MMk3r6fq9+k/YUUN+hDUYuMXxMxnBQF
X-Received: by 2002:a05:6000:26c5:b0:439:ba75:7db0 with SMTP id
 ffacd0b85a97d-439c7f650famr651838f8f.1.1772584630044; Tue, 03 Mar 2026
 16:37:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <84c687e56ed8f04f3f318f090272fb5ef7520e96.camel@gmail.com> <20260304002205.15728-1-slava.imameev@crowdstrike.com>
In-Reply-To: <20260304002205.15728-1-slava.imameev@crowdstrike.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 3 Mar 2026 16:36:59 -0800
X-Gm-Features: AaiRm53fsqHcb7hskQftzErG4rG0bRpNrutpMN_cIrd9jgoITk4du18ug015Amc
Message-ID: <CAADnVQL9baabzG=Efv-PAdFbhdaoj8qSwHT_AxHODPW678Cq+A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 1/2] bpf: Support new pointer param types via
 SCALAR_VALUE for trampolines
To: Slava Imameev <slava.imameev@crowdstrike.com>
Cc: Eduard <eddyz87@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Hao Luo <haoluo@google.com>, Simon Horman <horms@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Jiri Olsa <jolsa@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	DL Linux Open Source Team <linux-open-source@crowdstrike.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Network Development <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 4:22=E2=80=AFPM Slava Imameev
<slava.imameev@crowdstrike.com> wrote:
>
> On Tue, 03 Mar 2026 14:43:01, Eduard Zingerman wrote:
> > On Wed, 2026-03-04 at 08:49 +1100, Slava Imameev wrote:
> > > On 2026-03-03 20:05 UTC, Eduard Zingerman wrote:
> > >
> > > > > @@ -6902,11 +6921,7 @@ bool btf_ctx_access(int off, int size, enu=
m bpf_access_type type,
> > > > >               }
> > > > >       }
> > > > >
> > > > > -     /*
> > > > > -      * If it's a pointer to void, it's the same as scalar from =
the verifier
> > > > > -      * safety POV. Either way, no futher pointer walking is all=
owed.
> > > > > -      */
> > > > > -     if (is_void_or_int_ptr(btf, t))
> > > > > +     if (is_ptr_treated_as_scalar(btf, t))
> > > > >               return true;
> > > >
> > > > I'm probably missing a point here, but what's wrong with Alexei's
> > > > suggestion to do this instead:
> > > >
> > > >         if (is_ptr_treated_as_scalar(btf, t))
> > > >                  return true;
> > > > ?
> >
> > Uh-oh, I copy-pasted the wrong snippet, sorry.
> > The correct snippet is:
> >
> >          if (btf_type_is_struct_ptr(btf, t))
> >                   return true;
> >
> > With it the selftests pass (except for `float` tests noted earlier).
> > And regardless of selftests, the code below this point will
> > error out if `t` is not a pointer to struct.
>
> I think you tested with
>
>         if (!btf_type_is_struct_ptr(btf, t))
>                 return true;
>
> I decided on a narrower condition, as
>
> - if (!btf_type_is_struct_ptr(btf, t)) -
>
> changes the existing selection condition from "treat only these types
> as scalar" to "treat as scalar any type that is not a pointer to
> structure". Technically both approaches cover the problem I'm trying
> to solve - multilevel pointer support for structures, but the latter is
> open-ended and changes the current approach, which checks for pointers
> to int and void. So I'm extending this to int, void, enum 32/64,
> function, and corresponding multilevel pointers to these types and
> multilevel pointers to structures.
>
> It seems - if (!btf_type_is_struct_ptr(btf, t)) - works, but it's
> challenging to strictly prove it's sufficiently future-proof.
>
> > > This reflects my belief in a cautious approach: adding support
> > > only for selected types with tests added for each new type. That said=
,
> > > I can add the suggested broader condition and make it pass the tests,
> > but I cannot be sure it will be future-proof against conflicts.
> > >
> > > I think the broader check like
> > >
> > >       /* skip modifiers */
> > >       tt =3D t;
> > >       while (btf_type_is_modifier(tt))
> > >               tt =3D btf_type_by_id(btf, tt->type);
> > >       if (!btf_type_is_struct(tt))
> > >               return true;
> >
> > btf_type_is_struct_ptr() is almost identical to the snippet above.
> >
> > > might have some incompatibility with future changes, compared to
> > > explicit type checks for selected types. This condition is
> > > open-ended, including anything instead of selecting specific types.
> >
> > What potential incompatibility do you expect?
> > Two things change:
> > - types other then `struct foo *` or `int` can be read:
> >   - do you expect we would want to deny reading some ctx
> >     fields in the future?
> > - the value read is marked as scalar:
> >   - not much can be done with a scalar, except for leaking it to
> >     e.g. some map or ring buffer. Do you expect this to problematic?
> >
> > Note that the above are selected based on type, not on the
> > function/parameter combination, which is already not a very effective
> > filter if some parameters need to be hidden.
>
> I do not think any of these represent a real problem. As I said,
> my approach is based mostly on narrowing the supported types to
> reduce potential conflicts.
>
> I do not have a good example of such conflicts.
> The added tests for pointer to float, which failed with -
> if (!btf_type_is_struct_ptr(btf, t)) - might be an example when adding
> a new type might silently pass this check because of missing tests.
>
> I  was not able to convince myself a conflict will not  happen.
>
> That said, changing
>
>         if (is_ptr_treated_as_scalar(btf, t))
>                 return true;
>
>         to
>
>         if (!btf_type_is_struct_ptr(btf, t))
>                 return true;
>
> just makes the scope of these changes wider. This was
> my initial approach to this problem, but I was worried
> by its wide scope.

You contradict yourself. If returning scalar today for pointer-to-pointer
is backward compatible in case we want to make it smarter,
then returning scalar for all is backward compat as well.
So no reason to introduce is_ptr_treated_as_scalar().

Also simplify tests as Eduard suggested.

pw-bot: cr
