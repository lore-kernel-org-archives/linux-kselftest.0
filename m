Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D480D542ED6
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 19:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791921203; cv=pass; b=cbOdvP23019PmyIYyW+WcwPvxlZmab+rhqrwnKukKHtYYuD4LBfxn0AJl3jAMNfD1Iuv8iv1i35deS882c8eNluXAIlaWG5OwbDMeztwSd2QAksbO0NbIYYTh0TwZs5eCt5DU+ISokxN/UHJEuLTRSqq2EqOCeAlSzDg1BxXw5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791921203; c=relaxed/simple;
	bh=kZcNHRKweJx+iHr6GYPUVcEw90YDQL8CUNxb6aSZzLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iML0CJJvork3SRxvQtxknTpyMyRzV28b0lse8PtjEguIu69sn2yZhulZZlUzfd7GknTeY6fae1564qiq+vS7ceMZaELZtVzMshhbGeaJQvi+xlBzHCW9Ps5WbI3fZzNkAJpAIAFVSrpFeeqg6h/t2KPdbSJ8UHRzbgdcMHmPByY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QVGlPl2q; arc=pass smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QVGlPl2q"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-98301b325c4so948590241.1
        for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 12:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791921201; cv=none;
        d=google.com; s=arc-20260327;
        b=oeTW7ATNsZoBImvnTixH+nsC2JStN6dSoBd2q+XLlP5HizOU5Cm3kxLznfUkCqc6N5
         sErkBY5c5fDJZGir9qz7JahokctPJIaeg3MMTymavpZwrfz0c6j5qMKiUns5N/UjSfQu
         91aXSqW46Z6vR/+YvbIKjdEUwmp8gMJCVEUVVo5zv8Gfy+8slhOduP2O6nGrZo7tVAIS
         2VidUGC6uLGiTbBtUCpKzi/70kH22CtbwRq0Cqwe4njOhzyCVs0QRDrsXPd3Rk2v+lis
         PAkAWSA5IXFK0+0chr/sH46XvZcyxBJ+jrL5Fof6q4W2smZg+R0yYZ95ta2/roVWOQG2
         PbSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Itq5Kt1Cpx9UyAaFaUspzDtgaSrQMGirNxVH3aVF5nQ=;
        fh=vKZ5TkfOcTTmVrTNQU8Ch9/UYfjyLuKgJ4GBa+qj4q4=;
        b=AJEZiSGIo3w76NQJiTUj5BN6hfJNOJskZpK0T8KAFguBwGZK9obaArWy7nFoXHQ8X+
         3z2NAiYrNexlDdrhEHfDdQOEGsy+0TWsIu0WFBLlR9FMT98kE0UzAv9r3VYVZlMw7Z+8
         N6t1zFcABEvGZ6YpgEp0AhlbjzwPQHLBb51Gt1P9CUba71L22N4G6K217uAposhEtOmF
         fkA4QgcS/ggIvqkq/uz5vi4XbdrNNIBAT+V8pt5jWzju9Uj6EJU4/yrmt8H075jfvfwb
         4CfYm5klJKax4y6qwh+riSyoH51cENZvxufa80HTuJH+G9WKgUQi+6J1iPBu1efPHz1g
         pqYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791921201; x=1792526001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Itq5Kt1Cpx9UyAaFaUspzDtgaSrQMGirNxVH3aVF5nQ=;
        b=QVGlPl2qfCpHQIJgYmlMoeB3u2b11/EgHKdBkxLXkrqIRszsvgZ+YS1iE/ALMsS5YL
         INUhh1ygHTwoTIY1s3pQUTKlxAUo4Y1Bv6AAeRsigQmYuWgJNuWM4clCnXYDcAtXFg0y
         2lW+5cpfox7mzC5lkBbHhJ5usDndqPbfUa5kZnL9vNSg3+BtacP+QtGjbL68xZNJe24w
         UxYWt8lDGnk+tqtWuDiPkA/BkNRVpev4dJ81iDYcgQiuIazACV51jFpOw0xn4ZDoKkGh
         nCyRZPWB8yNq+LuyVM+KDbaHWto9P86I9CssWfl0xIsugXxwuMSYw9ySa29knrR1zrpD
         kJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791921201; x=1792526001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Itq5Kt1Cpx9UyAaFaUspzDtgaSrQMGirNxVH3aVF5nQ=;
        b=LXGvxJCdOh9QetwYd/RNbZpbTnka4TRlNWnS0OI2b64//bzUjgJCO1pg6e1rkcacUn
         n2kCeaq6i6Oeua+vsxD87HFjD5ZTiPf5fvR7TeCbkODhqukcBwl7aAb9uFmrzggR9Ya9
         B6u7Qgfh9oUbGLxmMC8jgoZcmLLaMgwVuDj9T80cfclivOyRBdGNHChjceo/Awil3v+a
         KFnVuCdf5Rhz5DbSYCXKUg0cjSDEVN/3nILGD9yJKuLMGIUqUY++Jaqo/uww6LEyCOJ3
         5OTxNSZ/xl/YZHNPotp0pBxKy0H1wEGuE0Tmj1tm6i3qTGEB/sBDyUFprOPJMb/Ea6S2
         pB4w==
X-Forwarded-Encrypted: i=1; AKwUvBz82inr+y/+1ziJZY2ax95VgImz3gOi8E+2uTrVoYR0YIycbKk92AMvnF0Qi5acgh8oGGKVelbjhHxQ/QD54OM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoNqwRTIH6noeAqlNqD+pFJ2my+ts3IU2Pk18sCPTuL+XC7Gg8
	+jns/jsHKav/FQ2vqGOoRkB2WsON/mhbKEoIxMlbdLfW1HQoicnGnNTJ4TruZtqMzrdyDATyJWu
	VUmVrSieWje3OPhDpul1B6YbDkoWbIPMtzN3tXaT8
X-Gm-Gg: AYBFou2XRYybuxj76+8dTmEV5gUc5PC+uhiF5YcgQNmSAzV6dgfOzN79V5mRRJYYFlN
	1Erq/44KER0AculGrx7nnSpGj79KTZdFW/SmtljShYGmGAcAiVMgplL7FjENEDgxu7V6jKxKJqE
	R6uq9Ew//6g8h7RI59oWnIN9ZE/F/vnrGtPMh/t88TojrCYV7uTS5qONWRZxRXza72/Zm5eop4z
	Q/ZPDAML93e9nO82JckWmu6yBve9YmFRQ0uuD1f0omsdsZgo4ovKWIloyqZmjbZuHtRb6T+uHD1
	NF7vySLoQsVtP0s8cZ/NR56hGXW5F+o+vYHtAyIKQlnogRwmHgbwYDGynp9U7SIOoA9dmmQSJew
	YxxguVSauMg==
X-Received: by 2002:a05:6102:38ce:b0:7c3:3c75:db89 with SMTP id
 ada2fe7eead31-7cb3a117b27mr3126273137.25.1791921199874; Tue, 13 Oct 2026
 12:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-kunit-parallel-v1-0-f4be28c895e5@kernel.org> <20261013-kunit-parallel-v1-6-f4be28c895e5@kernel.org>
In-Reply-To: <20261013-kunit-parallel-v1-6-f4be28c895e5@kernel.org>
From: Daniel Latypov <dlatypov@google.com>
Date: Tue, 13 Oct 2026 12:53:08 -0700
X-Gm-Features: AclHuK8z2hwcwxCnPzLLSbjbaXHYfi3CL2D7DyPENfay0wYMSMnrgT2M8XDF-Lw
Message-ID: <CAGS_qxrRMoy2fB3zzpD=bOf7R4not5TqpDXE3a-dRKJOpyRt8A@mail.gmail.com>
Subject: Re: [PATCH 6/7] kunit: tool: Serialise output written from multiple threads
To: Mark Brown <broonie@kernel.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:52=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Python's text streams are not thread safe. If two threads write to
> sys.stdout at the same time the stream's internal buffer can be
> corrupted, resulting in lost output and runs of NUL bytes or heap
> garbage being written in its place. This isn't an issue currently, but
> will be when we implement support for parallel test execution.
>
> Add a lock to kunit_printer which Printer.print() takes around each

Firstly, thanks for taking on test parallelization!
In March 2022, I'd written a proof of concept that worked, it just
leaked some memory on the C side so I never shared it.
(Instead of using the existing test filter glob, I'd added the ability
to specify arbitrary test indices to run a slice of tests)

I'd have to reacquaint myself with the code to actually review the series.
But one thing that sticks out immediately is, my version had added
this new type to avoid the need for any locking:

+class BufferPrinter(Printer):
+       """Like Printer, but only prints to an in-memory buffer."""
+
+       def __init__(self, parent: Printer):
+               """Creates a new printer that inherits parent's
settings (use_color)."""
+               buf =3D io.StringIO()
+               super().__init__(buf)
+               self._use_color =3D parent._use_color
+
+               self._parent =3D parent
+               self._buf =3D buf
+
+       def close(self):
+               """Prints the contents to the parent printer and frees
memory."""
+               self._parent.print(self._buf.getvalue().rstrip('\n'))
+               self._buf.close()
+

It required passing along kunit_printer.Printer objects to more
functions, but I think it might be a cleaner end result.
By explicitly calling `close()`, we could control when exactly output
gets flushed so we can avoid weird interleaving.
It seems in a later patch, you write each kernel's output to a file to
get the same effect, but an object like this could be used in more
places.
Thoughts?

-Daniel
