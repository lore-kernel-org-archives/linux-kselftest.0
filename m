Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07918382388
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 22:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772577790; cv=none; b=YW7WFWkdv0VRQuT8Dw3mvp2iPIYFuvriXDwdJJ88o7WBl/967vVt74vj2IGUuFP0odga8bL8fINyDJPId0qBdaSiTFC3G4Uj448uRmvG5XRmUIDhNnu64J3xFtsDClfhJHTO9IltPz0iA8kYR8gRB/0hYQgj32ld5IqWnHWtMbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772577790; c=relaxed/simple;
	bh=iRzTm4HZX6p9XF+OOGdafL6UcWV2KOdLvI4VUy9DbI4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ft+dBMPnvL3CGbM5f63i8Wt9iwFhMlp1321E5Rx8AG3KvU9cXGGcBjARFZwcdNMWVikT7dwOeppafxtUZ6YIVyLqz6XW+44JJjYmygTHXnoifhKIG+OnWhDQANyksl0aK7PTZMKgFyEWAf2xp8Sa9raVIwgibxQc2qHWr/5urFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/GOrEKL; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/GOrEKL"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso3607183eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Mar 2026 14:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772577785; x=1773182585; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+g++eAKNPgksF/0EobVZq+2vjzSAkpXPfK7PhSs7l5I=;
        b=Z/GOrEKLhYYDcpMAgAX0nCKHVWMfEjkVH/gJtOLCBuGGgzv3r+MncZE1SfOdwxqSf8
         EhgCwi0+A1/H7T2wsrypWCA+9357xB7UtkByf8WoKwLKvXTjRatSjqdFnZq6sBtqVHtV
         1AJHElA8+dtaHZV4+ch9/d8e0+69WhEndwymNikyv4T7PYinjw/v2db8xJ179zAMad/6
         aUJJWwl42oq99wsSFmtLzfbnKmlh+2rD12cI6LlqdCWHbbOxVAXs2x9Z8orPKXhX3L+r
         00ewyXgVSeO2XeOrS0P5yItlRt95mQ6bZWr1iRSv+voL2Q5ZjvA+ZG/Y5TRjw9NL65+6
         Rkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772577785; x=1773182585;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+g++eAKNPgksF/0EobVZq+2vjzSAkpXPfK7PhSs7l5I=;
        b=hkRZrmt43Ji0c5QSf8BecDjFW+DipymmBcpzM99XG7leQbAemI98SDYscCs2wn8RVO
         aet4pWcG1s3x580e/AN4M0YRNzJJ8MGACok+4W7P4o/+cvyteHILGzaRxNjvyNnQGB7j
         EAM9S3U3ZZZ2M7dPe7jyL/RSELDbc8rMzYWFvC0P6OjvZjBHhpyXwjI/wrcrfdscDR9I
         LDiaNcKrgYsDx/gJs6l12hNrDHT+CfBigxPRcyLIsDaOBfUO0jYKD9n20sS9K4Q/QfPH
         ZNt9+Vsdhl9V0jxkr6ngRFk518Eowrfjl+oEb8WdacPPQLYhqo2zHglrJ17MirO+k2Cn
         0T3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaUdxekAPW98bXWCddVm9Rl8zy9hh6FQMhbFm5+SEa+4wxmg6dyjWakj/skv8VOjFQRHSnGTeYnzjPg00C+x8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm2NpT8SczJiywPLzAEWAkExz/vJQ78PrXr/UEdQP/XY62hJgF
	TyJHue8OhLfkWHV60jZwJD52HM9T1egmWLCkBTK06tY9kZxL3drGXmfj
X-Gm-Gg: ATEYQzyHzbRePyTpqU6DFzdW3/48ecpzk7ZFrlSzCD/84DyjgTb2400qX6+DDQdfnxz
	zf5eqle4mO60G0V/p5MHAh+qgUbYxW7BckRRCRii7IQhzSv8bHMlIS6CIn887Oiu9SL/zWWrnru
	7lMFlnKm5fBMAQQo01rdZ9GxncFss9itljJ1f1/ZHVzDyX3sB/NFU0tpdiJa5buhmrqXc/hFkz5
	sBre+f3LKUgFM5UQU601/mSSTiTVoCLmyF7pvPqBlpHwNKunkcV7FxCP0MSS06FdEmvhhRV7/oS
	Phdv0lTpuF0PAz5TJjCiUxkBEpwIkWQrXZzAendiUi/pFtmSGEEkbWTwMM1xqXavWpw656ZGEs5
	U2AG7R3p8orBjAAUjaqaOBfZd0ZqYVlY6EuDKYy7qAALgazF9OmPdwabwvRwYYiTIlC5Q37mD0s
	dE0EVK71WOVqIjThWKkjUg13N9HLyxrNiflnKRcKi/sRfV1O4b678Drs+jZ1JDfe7gYdZ6B00wn
	l/XBOcA
X-Received: by 2002:a05:7300:dc83:b0:2b7:bc31:11ff with SMTP id 5a478bee46e88-2be2345bc93mr1332769eec.8.1772577784573;
        Tue, 03 Mar 2026 14:43:04 -0800 (PST)
Received: from ?IPv6:2a03:83e0:115c:1:bf8e:1331:ef2b:145d? ([2620:10d:c090:500::3:4473])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdfba0df2fsm10054683eec.7.2026.03.03.14.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 14:43:03 -0800 (PST)
Message-ID: <84c687e56ed8f04f3f318f090272fb5ef7520e96.camel@gmail.com>
Subject: Re: [PATCH bpf-next v4 1/2] bpf: Support new pointer param types
 via SCALAR_VALUE for trampolines
From: Eduard Zingerman <eddyz87@gmail.com>
To: Slava Imameev <slava.imameev@crowdstrike.com>
Cc: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org,
 daniel@iogearbox.net, 	davem@davemloft.net, edumazet@google.com,
 haoluo@google.com, horms@kernel.org, 	john.fastabend@gmail.com,
 jolsa@kernel.org, kpsingh@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-open-source@crowdstrike.com, martin.lau@linux.dev,
 netdev@vger.kernel.org, 	pabeni@redhat.com, sdf@fomichev.me,
 shuah@kernel.org, song@kernel.org, 	yonghong.song@linux.dev
Date: Tue, 03 Mar 2026 14:43:01 -0800
In-Reply-To: <20260303214929.8208-1-slava.imameev@crowdstrike.com>
References: <c40dd219ea60f810d52576f998e68cc0d731f761.camel@gmail.com>
	 <20260303214929.8208-1-slava.imameev@crowdstrike.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-03-04 at 08:49 +1100, Slava Imameev wrote:
> On 2026-03-03 20:05 UTC, Eduard Zingerman wrote:
>=20
> > > @@ -6902,11 +6921,7 @@ bool btf_ctx_access(int off, int size, enum bp=
f_access_type type,
> > >               }
> > >       }
> > >=20
> > > -     /*
> > > -      * If it's a pointer to void, it's the same as scalar from the =
verifier
> > > -      * safety POV. Either way, no futher pointer walking is allowed=
.
> > > -      */
> > > -     if (is_void_or_int_ptr(btf, t))
> > > +     if (is_ptr_treated_as_scalar(btf, t))
> > >               return true;
> >=20
> > I'm probably missing a point here, but what's wrong with Alexei's
> > suggestion to do this instead:
> >=20
> >         if (is_ptr_treated_as_scalar(btf, t))
> >                  return true;
> > ?

Uh-oh, I copy-pasted the wrong snippet, sorry.
The correct snippet is:

         if (btf_type_is_struct_ptr(btf, t))
                  return true;

With it the selftests pass (except for `float` tests noted earlier).
And regardless of selftests, the code below this point will
error out if `t` is not a pointer to struct.

> This reflects my belief in a cautious approach: adding support
> only for selected types with tests added for each new type. That said,
> I can add the suggested broader condition and make it pass the tests,
> but I cannot be sure it will be future-proof against conflicts.
>=20
> I think the broader check like
>=20
> 	/* skip modifiers */
> 	tt =3D t;
> 	while (btf_type_is_modifier(tt))
> 		tt =3D btf_type_by_id(btf, tt->type);
> 	if (!btf_type_is_struct(tt))
> 		return true;

btf_type_is_struct_ptr() is almost identical to the snippet above.

> might have some incompatibility with future changes, compared to
> explicit type checks for selected types. This condition is
> open-ended, including anything instead of selecting specific types.

What potential incompatibility do you expect?
Two things change:
- types other then `struct foo *` or `int` can be read:
  - do you expect we would want to deny reading some ctx
    fields in the future?
- the value read is marked as scalar:
  - not much can be done with a scalar, except for leaking it to
    e.g. some map or ring buffer. Do you expect this to problematic?

Note that the above are selected based on type, not on the
function/parameter combination, which is already not a very effective
filter if some parameters need to be hidden.

> This broader check also needs to be moved down closer to the exit
> from btf_ctx_access; otherwise, btf_ctx_access can exit early
> without executing the following code. In my case, this resulted in
> existing test failures if the above !btf_type_is_struct(tt) replaces
> current master's branch condition
>=20
> 	if (is_void_or_int_ptr(btf, t))
> 		return true;
>=20
> The result for:=20
>=20
> ./vmtest.sh -- ./test_progs
>=20
> was:
>=20
> 	Summary: 617/5770 PASSED, 80 SKIPPED, 82 FAILED
>=20
> with a lot of:
>=20
> 	unexpected_load_success
>=20
> Compared to:
>=20
> 	Summary: 692/6045 PASSED, 80 SKIPPED, 7 FAILED
>=20
> for the master branch.
>=20
> As I noted this diff, closer to the exit from btf_ctx_access,
> makes tests to pass:
>=20
>         if (!btf_type_is_struct(t)) {
> -               bpf_log(log,
> -                       "func '%s' arg%d type %s is not a struct\n",
> -                       tname, arg, btf_type_str(t));
> -               return false;
> +               info->reg_type =3D SCALAR_VALUE;
> +               return true;
>         }
>=20
>=20
> > Only two new tests fail:
> > - #554/62  verifier_ctx_ptr_param/fentry/pointer to float - invalid ctx=
 access:FAIL
> > - #554/63  verifier_ctx_ptr_param/fentry/double pointer to float - inva=
lid ctx access:FAIL
>=20
> > But I'd say this shouldn't matter.
> > This will also make selftests much simpler.
>=20
> Yes, I decided not to add support for pointers to float.
