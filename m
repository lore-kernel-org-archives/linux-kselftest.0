Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C467A371D16
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 22:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781218099; cv=none; b=e9hgOfJMpAhTohMUVE47hkgsQjc+DrilYNxNuGcnAEqukoYDHN0Nz9/HArGhSj7DnS/QkfltOVlgJQMjwEM6X+4HIpSpPLRirbHeOKBg4SsuMCqE9M+GWSjxf58QCaytuStthkPqT5y3P5IPJBsQYLKn2rYKgE36YlPPEvnRkrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781218099; c=relaxed/simple;
	bh=SOurTV8MVSezXPtIqOaux2KDSaFDWyGI/YwP8/bMyS0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=FM5ibfWm+VibBgQTphB12FFY1tocjDM3yK5syUKENthkW/q4Ac62UscdDd+viZ0v8r6Zry6S/TlChlSquZCEIbwQWa6iKp38qXMWwrc7TET4rsNtoY/vQTneCjhfRpb8eIM8tC7SCGqozoOLoA/Y+TNNLuSAqES5i1AcOprH9To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=GtbSd7T9; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="GtbSd7T9"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1382533d428so839625c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 15:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781218097; x=1781822897; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxLD5BCySm0EUvi8VVSUy2Of5J/r9n7rRnE2RlT1lf0=;
        b=GtbSd7T9J9+hwiJaCzoYCNC9UeQ1Dwpc9l4v8z+bIdy4ZmoJ3SziT2jRs6s4zcPDol
         MuPMrV03r6LBrUdGEe00fib7aimRibDVwn4JJLrJ89f7TQSYiQEthdNjGaILXRT7NwM0
         PFRNqB93v/jGvlgvrh7hFzr16kiWAizoaR4C1wMzBCKZFZq7USkFL9FzM5Bg0qDVJamk
         0krhjmWcHjhmKeE2cKucBc63V88xLOc77pQ5YJukNwhlp1iAxBWylI2BUIBLZNSTDMo+
         tk9n7Pfqg09h+j+DvcaQybisLMB4mFnN1l6Oi53ehRPj2x9Shq7n44map31qftrouOLk
         dulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781218097; x=1781822897;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BxLD5BCySm0EUvi8VVSUy2Of5J/r9n7rRnE2RlT1lf0=;
        b=EeZ/r0QXzStAhTGRV2A4/RPUgh2+rURnR9pLzFdliVlf4dc0MlxTi1SBrFOply1L1w
         UAAMBTsR+9nRxYiiwzRhiGKaoeWKNBbZw/z95objXw8o55mFfDisJvG9ra4MR2iPdLC9
         LooCpBbU6PtukyTIl57Z1OFmBOWLbtXusT1apP8G5CPa+gdGYv1XWsQLNPa98tnzAp6V
         6uO6DtD3StAGKkbnaCdtusEeEBHfDn/oU/sJGsm92Kdeh6YMDaVlVpE3tmzlbFmeQDF4
         BcJLwsySow/nPZzi3hQR6F5GUEfRo7NCsjhvtH547nHTeheY8FG29aUtdtqBORcdkYN+
         C6lg==
X-Forwarded-Encrypted: i=1; AFNElJ+uvQja1M6E5Ke8Ua0e1/CF/+yNbeJsL3dLWId1jSe1zZJ9yKNleIsCTXKzjDUUh+x8ufWHE0x8SJzxdAQuWwg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8vQv15LXmXG0NdynWBFmi8lOl8f1m1gcM/ImlQzCSQ2vOanvo
	frVhIyXPXZ4tDSp5q9fG0jPsn+fhk7+2t2dRymPq74PfsvfT7C+ks7ie4/tTM07GoK0=
X-Gm-Gg: Acq92OHDo0fl7ziBpVfw0Y1dJ1pmbF3DNsuARb9RPPkPLNtEx/XDqzeo6GUDGFAXA9V
	XkW5kFza6I1/es15e+j8QZY7UfGm6QKBSVrb2KQS0U0mJJweikH0joDzt9wgilA5GxIaGy0zGXn
	KP5HFY45kKqwDYpFsYZ2osjYLxmqHRrvoS6Uc2itDxYMFGWLqLp4Z3ogBShePd7S7/8oaohbhNc
	5JnF3vZiNhamVoav2wjRo8RWq2JAxqnNtW5L34uosp7tVRHNEt7j/mPgWATLYa36LycqJC94dGG
	OM5f+OfFYjsXr7f0D7VQ3uFqJYiL08zAOPkQvy9ba1oI8EjYpOoWPNDXAqVCy3nRnVJ3fnHxfaX
	3lpgPdYplRYrl8ht1DjhphNQlg2gmi+F+aMxxpc0LRMaczYeFvEDVCdfAejaxbicfWVI9/kcolJ
	V6FKi2
X-Received: by 2002:a05:7300:578f:b0:2f2:6dde:df53 with SMTP id 5a478bee46e88-3082009bd41mr206505eec.17.1781218096849;
        Thu, 11 Jun 2026 15:48:16 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::3c95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb8f8b2sm670952eec.27.2026.06.11.15.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 15:48:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 18:48:14 -0400
Message-Id: <DJ6L48CNN9YT.2JOLEI37QISDC@etsalapatis.com>
Subject: Re: [PATCH bpf-next] selftsets/bpf: Retry map update on
 helper_fill_hashmap()
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Gabriele Monaco" <gmonaco@redhat.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Shuah Khan"
 <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260611150704.95133-1-gmonaco@redhat.com>
In-Reply-To: <20260611150704.95133-1-gmonaco@redhat.com>

On Thu Jun 11, 2026 at 11:07 AM EDT, Gabriele Monaco wrote:
> helper_fill_hashmap() is used also on parallel and stress map tests.
> Those are consistently failing with ENOMEM on kernels built with
> PREEMPT_RT if preallocation is disabled. The failure is transient and
> only called by the memory cache refill running in a preemptible
> irq_work, which can easily stall in case of contention.
>
> Use a retriable update in those cases to handle transient ENOMEM and
> make the test more stable also on PREEMPT_RT.
> Also fix the sign of the value printed in case of error (strerror()
> expects a positive errno while updates return it negative).
>
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

The bot has a point about changing the code to & BPF_F_PREALLOC, but
we touch test_maps.c twice a year and that only for bugfixes. There will
probably be no other consumer of this function in the foreseeable future.
Similarly, the whole file uses CHECK() so imo it's fine to keep this as-is.

> ---
>  tools/testing/selftests/bpf/test_maps.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/test_maps.c b/tools/testing/self=
tests/bpf/test_maps.c
> index ccc5acd55f..c32da7bd8b 100644
> --- a/tools/testing/selftests/bpf/test_maps.c
> +++ b/tools/testing/selftests/bpf/test_maps.c
> @@ -260,6 +260,16 @@ static void test_hashmap_percpu(unsigned int task, v=
oid *data)
>  	close(fd);
>  }
> =20
> +#define MAP_RETRIES 20
> +
> +static bool can_retry(int err)
> +{
> +	return (err =3D=3D EAGAIN || err =3D=3D EBUSY ||
> +		((err =3D=3D ENOMEM || err =3D=3D E2BIG) &&
> +		 map_opts.map_flags =3D=3D BPF_F_NO_PREALLOC));
> +}
> +
> +
>  #define VALUE_SIZE 3
>  static int helper_fill_hashmap(int max_entries)
>  {
> @@ -274,10 +284,11 @@ static int helper_fill_hashmap(int max_entries)
> =20
>  	for (i =3D 0; i < max_entries; i++) {
>  		key =3D i; value[0] =3D key;
> -		ret =3D bpf_map_update_elem(fd, &key, value, BPF_NOEXIST);
> +		ret =3D map_update_retriable(fd, &key, value, BPF_NOEXIST,
> +					   MAP_RETRIES, can_retry);
>  		CHECK(ret !=3D 0,
>  		      "can't update hashmap",
> -		      "err: %s\n", strerror(ret));
> +		      "err: %s\n", strerror(-ret));
>  	}
> =20
>  	return fd;
> @@ -1392,17 +1403,9 @@ static void test_map_stress(void)
>  #define DO_UPDATE 1
>  #define DO_DELETE 0
> =20
> -#define MAP_RETRIES 20
>  #define MAX_DELAY_US 50000
>  #define MIN_DELAY_RANGE_US 5000
> =20
> -static bool can_retry(int err)
> -{
> -	return (err =3D=3D EAGAIN || err =3D=3D EBUSY ||
> -		((err =3D=3D ENOMEM || err =3D=3D E2BIG) &&
> -		 map_opts.map_flags =3D=3D BPF_F_NO_PREALLOC));
> -}
> -
>  int map_update_retriable(int map_fd, const void *key, const void *value,=
 int flags, int attempts,
>  			 retry_for_error_fn need_retry)
>  {
>
> base-commit: 2d3090a8aeb596a26935db0955d46c9a5db5c6ce

