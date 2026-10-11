Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CB8455625
	for <linux-kselftest@vger.kernel.org>; Sun, 11 Oct 2026 13:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791726821; cv=pass; b=iy91yREP3aWhXmJ2URB9qhEpCTC2TmFZYkXLwzYNSETod20j4D9WFmI/LDxzawdXo4DES86ipallnp3bf7m5DEdwyuBH8cx7bZdQObJQ0wgcFDe5sNZGJF0DlhEP1WIK291bp28qTYOUO0altCAz4S4FWtYejWNPk6sjcYkDuaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791726821; c=relaxed/simple;
	bh=OBMgnNwbLIUmOMsL8sUSTbTR/61EiCyt8GG/HSPY+Qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oa4venUfIlAZnHNcLhgBl5uBIM8RmGEnDDEcxMRdrt5jX9DDwMiin69bgzSxZDqc7PA007QUiNFmR3S9edSmAoTN46mCPn8TKSVSye8feWpKwiJraOVk+wRLIuU6+DfYCQHXAfECa+DgdREvdpav1BkTjFQlqUXY0vNyohpbWQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SH+Pe/aU; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SH+Pe/aU"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3535aa147d8so58609eec.2
        for <linux-kselftest@vger.kernel.org>; Sun, 11 Oct 2026 06:53:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791726819; cv=none;
        d=google.com; s=arc-20260327;
        b=QRiDdHXQHWbweKUsH3LF2X/CDltyJMHqqKbXSBDbn2Xr1veFqp6MItHsvu4GwTE7Jt
         QDMFo7e4GCPqc+GZuawkl6GtyaEh+RWDJoTmsiJpv7YTjL0l03iLccYx17A8whK+swYE
         TuY0xMw39hMFeuuSKjwMLgleiNXMRjs2sEcVzP0kI/riYwr2/nEFPZI3wU1iQwuX/LAj
         z0HeloVAc+/Sm+DBFeuUGjtAWc+nEQSGSIPftVYhfRdO7A+vrTc8Ts5L+H35ir1yt0eS
         bwF3ubYYkpm4Vy+5smvZrpKtDEH//l1c+DWBp5Nh2VN1pk8mrDW+pxS7klSP39TqtgW3
         tCXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OBMgnNwbLIUmOMsL8sUSTbTR/61EiCyt8GG/HSPY+Qc=;
        fh=FAjFsGZ62zwVkgdtZbuwQMZ6Yqvct4OujXU9zH/Z5yo=;
        b=o4ztW7FfHEVF3LzYrzzO3jzsQD5YdJvzo6DhcJQ6YfJWhKDPYPC2fZhc69KdCjZvmS
         jWRGaNk9huS9VWijSJ4VVAjHUyDDAAjqsFFJIIPBUmQqgb5lQDMAFArY8h4BzthZt07U
         7sDzmkCRZtIyrdeMKef4/cc8eNGk9N3k/TGr/+mAnrnL28d4dnm3u7C9QSXNQOQfDS9W
         fBABePPNV/bCReQ8itaTIRGc2BkeVfO/m7FPaTgJFX58o/mvPo0bUORc/kxQDIcHk7N4
         XhebOaFODQwLcnm5KSDTM4XUqzaZ/26w2SYk6i4AXVn0SraBwC2vQ9lVrck+QhKWoyZV
         BdIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791726819; x=1792331619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OBMgnNwbLIUmOMsL8sUSTbTR/61EiCyt8GG/HSPY+Qc=;
        b=SH+Pe/aUfQCWst3dbXchKKtAUo9gEOwW1iCr+xG8aALurikgr0hIyAaO+toqveQtob
         xytSX0OdTcb6mm7t2vOTFboCoP5Io5tf1mM0lE0rnMDveRdaoG9Geimn1U4SKM0dhxUz
         ftD/e8eSiUHkd+H5U3au9qwox2T3/5IvJjuKCN04VIkqF/UKV3zbV4x80To2IfeJNt4n
         98YH05Lv7WFKC9kaufq3kUo1uIemXxhFf+8WdJO1jZqlUkFfD+chaCs7fAQon2I0ABVZ
         Mop2GTVl4Grx0MaLllfGhqMT8QFmCgaMWsAAZA/qDd7wgU8KHDzoVEdsaP3Kj8UFXVDq
         1kGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791726819; x=1792331619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBMgnNwbLIUmOMsL8sUSTbTR/61EiCyt8GG/HSPY+Qc=;
        b=CZzlbB2gX/l/hlUpNPRINwa6FiSeMYczi5BuOnQZUQbyoKOYWdEBmYQcKfMpXw0AwL
         y1EzVOBIniwKqqkee8/W5CHlS0TV01YPaBz3pC2WDOOXxczsGrlAa36yoAV99UPoDbX0
         vbPEyZTDjyTeW71TQ0RY+aDs9CUjf7guQbTIIVsG4UIJskKxh+UOsKj5W9piVHkZjJHw
         s6n0MG1azZgFAtg0a+1XdyzbjiFVOzrUOvm2e074iyYw5PTwAzK2WJQa1vHxAsFF2KkA
         XOpk55BLIbllqsFN+7KsfQjIbDesApj6iyRYZj5byMAq3Qs2rhPxHRzx1kO4knjj3BWt
         fOHA==
X-Forwarded-Encrypted: i=1; AKwUvBwMFRqhpbjM9ExXgpgkLJhrMNzRRO39Hj0OYloPEyu2pG/oj9+ymQZhG1cLG1TW4r/lzPwE5EyEkAcGP+3P1UM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtqWecUDB1o3xdE8xIS1tuPhjhakAj9+E3Gdyjba/+xj8wkBbc
	KFRSsRSSB/+ZeYaPpe/1HKnrh/wHY3pV1zmbcl9DoTBU7LXcagS86vQjZIui0X3Dax0pO8AVtRe
	xL+oHVCw9xccc25XWn1IJ3Rr8TPI24f6z3dpt
X-Gm-Gg: AYBFou2A6PGe5/0gZ1SjEjaZeITwNrrHkKTio8pJ1p1zB+kdCf885+LTqm2Fsjo0oP8
	q++dHPQAOcGVxlk56jQGXat/ppBcXi6hpgZt2eznJbCkOgmVDHXNiXU/I+w/4dX/O0+FWcD1wmP
	PWQX+RrTgyAd+E7Vfbj6WHugiygKX9BtOo2Qda4qtHilhD5Qr21UCgu2HwG/xzpp4wUKvPxY4Ec
	Nf97EFGNJrei0hdXjajAIscPtsm1XQgRCzD/jReRiXspC7xF0Nl1OU3rC2m8F/8/lx8SEhHr4nz
	GymZmTRSFEWsXvQ+cj24ktQ46DSjqEkbpCtuzn85GsbMvnr7t8KVeBcWppoC4Cs26+y7f4kiWki
	LoRCqUxnC+oiwTEGOwBk7fpNsxnP/P+L9w0M58PsaVRK5ejLuEYwDCA57Qytg5IPKBcoF15ZiC5
	Pb3P3k7fLXCv1AotaTNKBh/cnzrrXnzXdSwGN1TortVOJHCmo0f1E=
X-Received: by 2002:a05:7300:c8c5:b0:351:7e15:9c59 with SMTP id
 5a478bee46e88-3537dc89f58mr15242775eec.0.1791726818852; Sun, 11 Oct 2026
 06:53:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-rust-dyndbg-v1-0-832e4039b71f@weissschuh.net> <20261011-rust-dyndbg-v1-4-832e4039b71f@weissschuh.net>
In-Reply-To: <20261011-rust-dyndbg-v1-4-832e4039b71f@weissschuh.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 15:53:26 +0200
X-Gm-Features: AclHuK8cVNPlyOorjrRhhdDkOJWkbQbDeGyNyJbJMfzEHu0iyDdJ7u6MM6NTRQ4
Message-ID: <CANiq72nN-X6pZJ8NhUOyLtXNPJWgh7oA7-kU9KaVnvjv-u1gOA@mail.gmail.com>
Subject: Re: [PATCH RFC 04/11] samples: rust_print: add debug messages
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lyude Paul <lyude@redhat.com>, Yury Norov <yury.norov@gmail.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:53=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> To make sure they are actually printed, enable debug assertions.

Hmm... why do we want to make sure of that? i.e. users can configure
the debug assertions, and the sample may show them if they are
enabled, just like any other code, no?

I guess you may want this for e.g. a CI, but in that CI one ideally
would test both cases, and assert that the messages both appear and
not appear depending on the case.

Cheers,
Miguel
