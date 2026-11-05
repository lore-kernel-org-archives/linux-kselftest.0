Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886402;
	b=YnH2kVvdFjlA0QTJ0r6GAPD21QeHuRF9aY3/Y/usidnSI+NLWgy1M6Kxfkt+7q7vyssN
	 u65wGHNynWW4QwJjYRYysR+YzQ1qgSuBNXIBD1EtZQQnf2ukgh4WB1l4K+/0BnddzfRt/
	 I+d9eB4W2mth7bCg5958rWA+CodVS50lI6qmzRkt7nU8Nj86OXDtFLWahsMsnRF6PiEw0
	 4UBSIy7/Z5F93Rq5bo9XXbGJfoKQ7GraWZQUjH+D0/qZcX/4Cj1/AxbiMs+MXj6SsYTji
	 9+DV+es/W2jie0CLxLHQOeDAqteJZd0QzgQCp1yuBvkaXofijK8ERwukh1XHJkYzN9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=/vPSGzrcpdRS3fICM7ap8IknGi3mQqqFBaTOgviuKOc=;
	b=vo2/uCbAt4xRNy9bNbQAIpij7eU1QyFDiQL1OhulexWiRKARRqY1sA6S8qIXiUUWvvb7
	 9xLMF+ua14AEwn498KdojVQhrK62R1cDh4CsmYIo+GpFZzH8oWvQvDNb6gsoHKKLCFw7u
	 JDCUXCgeSDbWLpHQyoa9S0v+MmcsU8cy5Im+s3XwjI6Frzj6CUCg8ImusbbLdKQknXOM+
	 skWbMiYGod6VHhotnp9sy0T7xSHpes0BE0Vmo11RCWTzX3aFzJ9u5wHxhZUIqfYihR+iW
	 gF5JMhY9tDDrtJS8TDyVSGKVFG+THt+28j8tWyeBMIfW/S7opE5IKjL1ZRJF9LIyqmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IH+RVuwx;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF0C606A32C
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 13:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBF0C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IH+RVuwx
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso11157685ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 05:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793886401; x=1794491201; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vPSGzrcpdRS3fICM7ap8IknGi3mQqqFBaTOgviuKOc=;
        b=IH+RVuwxIGYS+ptSubw3zVuKvxCYD5OLNL1eP0s4El01U4kCzmI0TYmQmuDZAe4xMM
         f2d35D08HOFyL+mRi6TnLDpLiuXbPGwdZ++KWgxANFGtdG+EinywYtq5FhY66LVupRUX
         Y6gL44mwhnIgJ+5T9cV8DQc3YFppkRcKIiAglBePWlab+gM9AUYg5ewyu4sQ4DFHidcK
         EQLpsRq64uaKaDg8jJ88xiFX74Q3oxcxrIst5wUI3JDf+rbXxnicXd5dEr9pIzLaTFPJ
         xt/TjL6jB3JmrH4BXyGqEDZewz1nAjoh/JTHKSWdyOeGBcYH1zKV+ojfP4pQ7Hjhjt+p
         AdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886401; x=1794491201;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vPSGzrcpdRS3fICM7ap8IknGi3mQqqFBaTOgviuKOc=;
        b=p7QFBI8UsSK8jCcxcaGw8mryEsh5RogeEe67Z0fEW23Qs7sUc3eo6wFwtfjZFbe23I
         lXbfGxzExXfHeu6B3xe2U8MUGCeYpFZrkhk3W3FnvefJlk6nqF/Gzju8ORqplVcJYrBH
         KL3AnLQZok1wGXAmF73L22bmtz9fQPvIzXU4oNHQaJ5li5YKjukUDisUtVvOA3V944dF
         KTTLibEawbTZTJSVMwt4aZrqxYFNCRVZpv4vlyTzEqeJKIeTffQ1qB1Ot/eSkWcBvv35
         KYNXNIHl708klRANcjyrBq0yQ3Gi8Wel6/8baiF+vw48MC8vfHNh7pg3pmKRSfFemw/B
         r6lQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdhAorcLGU/eGxMa/MFowaUUnj+mX5JCFWpR4+x9wERibGk5RDb8EJYbqKxIiy2WQ5BViSELM946nBMQsjXss=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DLtDeAEB8O1mphVgAWQ044y5e0dskmJHPP82lWjFMJy5Yw6ev
	GosFpTmeg7AnDfe4Zt3kpX0YnWk7bl9NdErg1tht5/3e8mopJ9w1f/E=
X-Gm-Gg: AYBFou3XmOic3NdmYINmRZRGbU2/rN1pAx24Jsb3DTsSoKyo8Mswgig+ChbGEEK1NDg
	7qcKdDb0Bd2/87GX41whb8pciYpaZ5cXznJL7SbdgmGZBA6UfLFK2YIfqh+BeASPiaiG+dWwGXX
	gMepUH91oMEZALkF3fwBBORb3zNJKgHZVx7HSRtKRoEJPvK+b5vYoarC3uG2LdGOTUZt8qTPIYe
	DOCoMjY7QXlSJx6aFvhlrvnR2MktbBsDdMvFNoWtVzMizc9m/ev2EAbwqIspCpEmsBjAcfhXBW7
	ka/RgPdgzTE5Jz97lGJCuSAoc5MaL3rBLAeDaoPEZY9BJ8QxJVkbkoyzEhApn/z68I0k+Jg6QF4
	c0Yk4jVxAB6umjOAfBZVZl/zoJeSHG860dlRqvCFP9Mx33CUCcB2M7rZQMrEV2VuNZHMZY1/Add
	2e++dZmZLeY/68nUFcVl8xcNy4ZW4pHm2x+fhMjGT4dlx9tTioLQlnp0VTZpsDftm1OHjrl7XfX
	gmzR5m3Kt0h/4pZFW8gaA9PwBjs7VqM6nTUnYqP/OKa2CU7UXi+BONcNXbXz2zb7ffoqfv768hU
	kp8Q0wVxkPErVb8j2xtVFCIAIk9nkYD33P2ABuzCj4IivDVsNt3goMKKd3DwY3Be
X-Received: by 2002:a17:903:3c27:b0:2e9:670f:d080 with SMTP id d9443c01a7336-2eb36450a4fmr182650275ad.32.1793886401061;
        Thu, 05 Nov 2026 05:46:41 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091cf87fsm17710175ad.67.2026.11.05.05.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 05:46:40 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 10:46:34 -0300
Message-Id: <DMNBNKKPHI0H.EZQ7YA2CSMEA@gmail.com>
To: "David Gow" <david@davidgow.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Benno Lossin" <lossin@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Burak Emir" <burak.emir@gmail.com>, "Rae Moar"
 <raemoar63@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>,
 <kunit-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] rust: kunit: support #[should_panic] and same
 test name with different #[cfg(...)]
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
X-Mailer: aerc 0.20.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <35284b5b-bf0c-4585-ad3e-a76bae4be7df@davidgow.net>
In-Reply-To: <35284b5b-bf0c-4585-ad3e-a76bae4be7df@davidgow.net>

On Tue Nov 3, 2026 at 11:45 AM -03, David Gow wrote:
> Thanks very much, Nicol=C3=A1s.
>
> I've had a closer look at the new version of this, and have a few=20
> comments. Ultimately, I think a mix of this version and the original RFC=
=20
> is probably best, and in particular, using a panic_handler instead of=20
> modifying kunit_try_catch, and removing the special-case assert!()=20
> handling would be ideal.
>
> Le 30/10/2026 =C3=A0 00:59, Nicol=C3=A1s Antinori via B4 Relay a =C3=A9cr=
it=C2=A0:
>> This patch series intends to implement two features for KUnit tests
>> written in Rust. The work is based on a TODO comment made in the
>> `bitmap.rs` module [1].
>>=20
>> Changelog:
>>=20
>> v2:
>> - Added more tests in `rust/kernel/kunit.rs` testing Sashiko findings
>>    and changes.
>> - Solved Sashiko: "[Low] kunit: spurious "try faulted" error logs for
>>    successful #[should_panic] tests": Solved by adding
>>    `rust_should_panic` in `kunit_try_catch` C struct to check if the tes=
t
>>    is expected to panic and act accordingly. Dismissed what I first talk=
ed
>>    about in [3].
>
> I think if we only handle Rust panics, this should go away, right?

Yes, it should. Since we won't `BUG()` anymore in case a test should
panic, the test thread won't exit with `-EINTR`. Because of this we
won't need to shield the feature behind a Kconfig symbol either, since
we won't have error logs in successful tests.

Here's the raw output from the panic handler version:

KTAP version 1
1..1
    KTAP version 1
    # Subtest: rust_kernel_kunit
    # speed: normal
    1..1
    # rust_test_kunit_panic_in_kunit_test.speed: normal
    ok 1 rust_test_kunit_panic_in_kunit_test
ok 1 rust_kernel_kunit

for test:

#[test]
#[should_panic]
fn rust_test_kunit_panic_in_kunit_test() {
    panic!("This test should panic and pass");
}

>> - Now the tests that have an inactive #[cfg(..)] do not appear un the
>>    KUnit execution summary as ignored, they just do not run.
>> Link to v1: https://lore.kernel.org/all/20260930-rust_kunit_v4-v1-0-e3b0=
d45311dd@gmail.com/
>>=20
>> - RFC patch: https://lore.kernel.org/rust-for-linux/cover.1789500084.git=
.nico.antinori.7@gmail.com/
>>=20
>> 1. Supporting `#[should_panic]` [2]:
>>=20
>> KUnit tests in Rust follow the user-space syntax, but at the moment
>> `#[should_panic]` is not supported. The first patch of this series adds
>> support for the attribute (only in its basic form, `#[should_panic =3D
>> "message"]` is not supported yet).
>>=20
>> The way it is supported is by adding a new boolean property called
>> `rust_should_panic` to `kunit_attributes` struct in kunit/test.h and in
>> `kunit_attributes` in kunit/try-catch.h and check for the
>> `try_catch->try_result` code and the named flag to detect if there was a
>> panic in `kunit_try_catch_run` function.
>
> I think rust_should_panic as an attribute is good, but it should just be=
=20
> checked from a panic_handler. If it supports more than just rust panics,=
=20
> it probably shouldn't be called *rust_*should_panic (and again, should=20
> probably be based on the warning suppression instead).

If we consider failed `assert!` from outside a #[test] function panics,
then I'll leave it like this, otherwise I am thinking of
`rust_should_fail`.

Thank you!
Nicol=C3=A1s
