Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF2E439345
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786449858; cv=pass; b=mcqzegGpMy/MHN0Dc0T7k7Sq88o9iEs1HjVosvBj43b+mtgUlNZDmxQiw2Wc3I59aQ6vC7q85rsxJTPL3Iqb4cP2ZXofkFP8GVxgn0xYYLDO27eFclwir5Te4ECbLa/DfAGl9ENlpiD8Jn69eU5iMBStRj2DMFXCdTyrdf6xO24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786449858; c=relaxed/simple;
	bh=n5XJVxyjKKrvU5Tf2BH3DhTGCWaD7m72/K/SFjbzLoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPFAg4b3gwkM5wU7F3PbdWhHDTkHQjWT9fSQqlIkxoTNs0nud+w/TgO5vJ1iDZx+y0r3LE1DidKq3k2dU3uIyfiYZ6pnd04WIIQriRxI0FRkz2GKTwylFzzGtSfqcKpo+V5ilOmVjzKc9AcFbtvN+yE7lpq2HSHmjR+Wf+9Rp6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxozYGlr; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxozYGlr"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ceeee8c46bso7521605ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 05:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786449857; cv=none;
        d=google.com; s=arc-20260327;
        b=HhLTvwyGm9tLLpREbIbVm4oGXTDUytNXKI0hJDVYEnbbpKoxjJNU74ymw+MhtZ3qDv
         jY8yUi+v0Ry+o5+qmdQd9gV81g+EwRaZqu42SmNWLkJO+Px/AfNy7PcQ89ZHf+k3hl9v
         nlsYubRLSRZQtp2trjZ4hgnxMQlhgYmuh0FdlQK/Ii/MwRYth6ghnqwtZ+PrKyOR7TrX
         OkNNlAqVWAw46fdOWafgUT94Y+SNlysqpv0ojMyQG//ZM2uzy9q9uW5foWL5U5/0VSbG
         0gxnaQziiAMw5GjvoRTkVsxV+HKXoXmFXyxBUiX42oF2pUOeN28+P/4XG/aST2LFA+rA
         sqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wUDPKIt4JBK1aml5H9p9mMv/VAzBV2eGmvqYyRcgH2M=;
        fh=/SO8dAC3iLJKmEjon2Df7jWNEXBCEBq2CJ1pTCp3hZM=;
        b=Kn9vyOlRPBst5ytUU6VicPYIPgTdW+bCuv5yyJpy5v8tcFMxUwUGNKwo0c/eWCe9FV
         WES76Hhngbwe4jmK3cywWevZf0SRZ/QTUmSQhTzDiJvs72rL9KgYiWqUHZkr/w7mEIeS
         TpJDhORGZEuNlQHmHY0n8/DodkjlQcbPqETMj+gGeLIkde8yAvvlAIMsQVhTC6Kf7qev
         KMhwbwi+Y1FxjHzbcspRejP1ourJCATm9B3CjDs6JLTFyeVursemBE/IPcNPLBJqYIIa
         l89xtvhBk8Fd/E8O+g7G3I4jQPCBson1271le7QLS79TQ//vqDYhYqGhrG3RfkLl4z+M
         fmRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786449857; x=1787054657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wUDPKIt4JBK1aml5H9p9mMv/VAzBV2eGmvqYyRcgH2M=;
        b=cxozYGlrlGsWOlB+YPoNpI6et8KnODitU3xhoSllVmTaoRIdF1Gtfg/qlTM2rzZHl+
         ynKQtfUwzRtFvFG7HlrSRsRETzCkdkuyKFF3EhCx1mbnYCUDnhXwyrdnVVYx/xaRyjMb
         RnWD4ubdndgVjnzjOttthDARj9phkw3XrduiK/PAu9BSOpAbRuy2T7Elec/m8L4N6a23
         SrDfQoJ2edMXVnD4G5zAaZ9NLIpJuG1DLH5KSGS0LG0Fe5pu3Zmz5vUG4pG8lkk7YegX
         mwyMh2hI9JB4Q5GEeP1srSDT1Rq2xBgqBiUzk9l5xU69KiD6D+IosZv4hexfebVxSqm2
         oEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786449857; x=1787054657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wUDPKIt4JBK1aml5H9p9mMv/VAzBV2eGmvqYyRcgH2M=;
        b=r56+hDOFQbeYDx+Et9G4TppWhw6pTGmUlBxhuBy+Vnl9DISUawLOD2bUnNS5BGRbK8
         e+l8uk0n0j/LVAUK8CVjfN6UpmF13W0C6IrvAomvg6AxZySjfn3sedRHMSUrrRDGlgrv
         b2cQggc6QUqSTXGX3IApCyl4/lybxDkmJaprsF40DcPfVQ1120nHPCToKWiqfE76vfSf
         EwwAxLZSHx4EUnZultJ8xv++CPOgZ8tdDcxuLKiry5SZ6HDozwHemLZ26n08eu8ybjUC
         UU2yIZDM37T7xys4fpolBlxCkMYaf6meD502bXYjfM8+4xm1H+zCe2vksqKJQ843M3Ko
         ft9Q==
X-Forwarded-Encrypted: i=1; AHgh+RpVSeRkeY0xAbYeD3q3jesbzSa+vvQ6Mtpy+3Oto2G03XNHOCt0U4SLv2sE6QZfWug1OWbVnL16gA761sdrwhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeyHV985guDU1ORPh65CI9WeUnNqoi8aI/OhO0YeLBZbscemBO
	hOQLE44i5Csv/XFrG6UGM6ttkLJ9CKePq85jMrG/bUnT9m/PttELfeWf5NwMVvUvF6riDlP41Mw
	a3mDobjS6Y/IkG0Ec6lTxPvYtqhGdzTU=
X-Gm-Gg: AR+sD12IBs2MYpHIp1fwtSD4p9BEKs19alJm6b93ENTPRzjpxtNe8XYf33Zt7MqN2d+
	2Jc6PnVGGwKujWluQlBqN9Knp0aBfsEFoWIVeTvcGzqGNNf3ADS1QLhqg1CrxrQw/wLcJQSrJ9H
	23GLNSPIBujMpq0End9Y/tAwQFrTQ9zHe8VHqEHcwjQCXsst1n5p8aMd/xWtru8sRpVsGoroynH
	Igfn3WwBnqwt/O49rGx1PkraOvaFZ/uxCG+6ZgfqSsH+ogOrBMA34DWaGlY18Q3UoIS3z/d815y
	OzjV5so5U1uACjpM0UuOzR1C/UPjC6KBw3gFK6OxursoZLyEJvcBKlRH7ngYiEwHBkPT70Tk0ur
	UmS9FnFGFiA0MTtlUzWqCzC/DewL4aeuVnCYqIA/Q+TT5Rw3BUAKsaJ0evGRN
X-Received: by 2002:a17:902:f791:b0:2ca:d803:5c8f with SMTP id
 d9443c01a7336-2d31776844emr24387845ad.1.1786449856837; Tue, 11 Aug 2026
 05:04:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-miscdev-use-format-v3-0-56240ca70d0c@linux.dev>
In-Reply-To: <20260521-miscdev-use-format-v3-0-56240ca70d0c@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 14:04:03 +0200
X-Gm-Features: AUfX_mzOxCPBjocWw0ax4auF6rYqKD0_LaTTX8RHaI1gQQL1Hg_Az3mrgi7m2gE
Message-ID: <CANiq72=sfSc3_cS6Z+JvjyYLmXjc8pr5CcEzOe0Awa3u0JvEfQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] rust: use vertical import style and remove
 redundant imports
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 8:57=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wro=
te:
>
>       rust: doctest: use vertical import style

Applied (this one only) to `rust-next` -- thanks everyone!

Cheers,
Miguel
