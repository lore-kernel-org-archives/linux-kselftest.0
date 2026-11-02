Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643534;
	b=ciywmJdlRlq77ulq9UyphZwJ61id4gS1BQy/7MDgi8UnBGDYPZHStQyLVZP9JnSpjO7o
	 wgm9DPNqhtoOZF3hOuT3+gD/+fFaDIUqiR/0a3UGNkEPOJZwJ9Q/zVNwcqiu5SGi447jV
	 fnUMfUOEY3Ro8+1o2lhYSYALVRS7mKHmZtKXniSHz6rSvg2ehsShbQpsi6tAwbimIXP2F
	 XyCrmeMzOwnD1VuO3Pio7LNbjXxVcW7IdWszhKojG6hLjWDnNwxsVrVJvjzJmkcdhmqCL
	 s/vfh+vkB0M6zwSTs004akuVhqEgtJ4IL8MfwDu8wUiGLUTJD6LbTkwRcDNBD61u9MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643534;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Feedback-ID:
	 X-Pm-Original-To:Received:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=o4fnmGuYE2qLagLLz4EmxxYZ3imDPsAHaJFgN5jWSiE=;
	b=vCuYxMhevbx4w6oo5ZLkkAYvKB+rbU0kfPDE934Z7c0aw/dAHeoE1xBZBLH8fb2u4URU
	 Izv89+ktf+rUIE2a49pTnKD4dGKSaDn9RCnRIoY70qmo6af0PlhIx5tEWY670dbVXY2ti
	 lMXWmuCR72SE73fDPVBmI/XGNeLtlv572FNSmdZUb90pqhktsrizHGTBeEqI9h/mcV53p
	 TB1lkVJcEz2qL6eD+P8eJMotAYQybhvsN1Ei+v0/tgAZEgBzco142BY/MZQih/0DnHJZK
	 wLyR9YSHDfah7MVf6jOYqhGsHKQjAbieW53hSJuGJiS6oz0z09Ko2rv3iyQEH6XaGRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=younes.io;
	spf=pass smtp.mailfrom=younes.io;
	dkim=pass header.d=younes.io header.i=@younes.io header.a=rsa-sha256 header.s=purelymail2 header.b=IfF1ease;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=vYWSPGJ+;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41232606A324
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 18:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41232606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=younes.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=younes.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=younes.io header.i=@younes.io header.a=rsa-sha256 header.s=purelymail2 header.b=IfF1ease;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=vYWSPGJ+
DKIM-Signature: a=rsa-sha256; b=IfF1easev/Ee2YVPBiTxxFyUeVOpwPyg7AtV5wA9t1zybRzNu74YDPlVCqmhnuiMOlxU/618TmPjvTF2zWcgqe4AQw1PvYSy2GiQDgPgcdy0P6PIoDYOrQgLow5HZnwWkw5zQeWix0cv2eaTz1iGlvizsUzWTjYRNUeGQXPDoVbNtBqkI5bror6WXto0D87a0PTz52TpDarLTXwN7tbISiutVWyPBd3NpYVTayArJ7urvKg51D8f4AMR6IcsJ3itAYz25LTAvzvnVD7Z5wrGlgo2//75w23EniYyEcFD+R4Oa9Jl1gUIZtgtqQSqiL6lqFpr4yWOLgZW4qra0rDddw==; s=purelymail2; d=younes.io; v=1; bh=o4fnmGuYE2qLagLLz4EmxxYZ3imDPsAHaJFgN5jWSiE=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=vYWSPGJ+XF++FZqXhv68N8DXNOgOur1+ajGn94jx2GrOw6jqMZD+b1NeP2E1pMkWLK9IB1StvUhHRRsrJeZ3lhBOV4PHHrPABwZ6/9pahde8WFVZEa5bpX3NJkzaUX3T8nSkeDQuYUtuEe1dY47VvqzZBHmPksbB02BkubEO9+RZ7eAg+145wat8+B7BoS9leuALbiJX7kOx4ROBgB3DZwGrKqIP7g8072yiBCm/YyhZ8zRURP9r4VkvlGdm7u3KLIvp+aBLl+50Gsi9uw1BAAu+RHO//dUgcZ7I3MlASOtvLltu9YCHpWcO3WzJdRL05PDDcf1ShhJgv3RGrqByZQ==; s=purelymail2; d=purelymail.com; v=1; bh=o4fnmGuYE2qLagLLz4EmxxYZ3imDPsAHaJFgN5jWSiE=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 1578161:62319:null:purelymail
X-Pm-Original-To: linux-kselftest@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1704967885;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 02 Nov 2026 18:18:12 +0000 (UTC)
From: Younes Akhouayri <git@younes.io>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Shuah Khan <skhan@linuxfoundation.org>, rust-for-linux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: doctest: fix line numbers after crate-level attributes
Date: Mon, 2 Nov 2026 18:18:12 +0000
Message-ID: <kw-1793643492.088831861-665782-0@younes.io>
In-Reply-To: <CANiq72k=Ru3QsiUjrXOtFqVuA-D+w8fJ2fUOTAL2cKFS0EhLDQ@mail.gmail.com>
References: <20261027-rust-doctest-line-fix-v1-1-0c13185a58b6@younes.io>
 <CANiq72ntn6ThPz9Q6+BxU6w-x2jUQ50xpiy1_gCRi6o0peHi8w@mail.gmail.com>
 <kw-1793624159.027890950-307523-1@younes.io>
 <CANiq72k=Ru3QsiUjrXOtFqVuA-D+w8fJ2fUOTAL2cKFS0EhLDQ@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon, 2 Nov 2026 15:26:29 +0100, Miguel Ojeda wrote:
> If what we want is for people to simply notice, then I was thinking of
> just `unwrap()`ping like others we have around there.
>
> Having said that, it can be annoying and confusing if someone writes a
> doctest and has to figure out what to change in these scripts (scripts
> that they may not even know they exist...).
>
> Ideally, I think we would have a "warning" somehow, i.e. something
> that doesn't stop people from working but that will get noticed.

Makes sense.

Note that a doctest author cannot really trigger this check: it only
looks at the first line of rustdoc's output, which rustdoc writes
itself, so in practice only a toolchain change would hit it.

The generator's stderr already ends up in the build log (only rustdoc's
stdout is sent to /dev/null in rust/Makefile), so for v2 I'll do: if the
output starts with `#![allow(unused)]`, subtract the moved lines with a
plain `- 1`; otherwise print a single warning naming the test and the
script, and apply no adjustment, so things keep working as today with
possibly wrong line numbers. I'll also note in the comment that only
single-line attributes are handled.

Best regards,
Younes
