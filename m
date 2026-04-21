Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17F637106E
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 22:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776812393; cv=pass; b=OOkMyVBjpvPX0UO/VyAc5XB2EQ0Dk3gmVWGjnC9lHMFXJK705rjoTMTuMUma9TqFSmeTYoL3qDg9MmRzuAbcW2982YWmpS/EJMwvm+iaUxzFAFwZusguvTp7ZsXS5Zxd3Xb0/JPchdrVUo5dTf7moA0Kxgyf5DcLSoestgskiUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776812393; c=relaxed/simple;
	bh=a3Prwcdh8j9+3CtUCjVP05sQvOvEc9TKH7JXC6xKWl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NcWg/QZfGIzXHLn+r5GuB5BFSHfPlVi/52/3u3lZiHZAHrT3gQgeDbIk028he5Buxa4cUPZB5fRC+XBfw+AoP5kSYQhlGLs4AeDXxkAx8LAby5JQpCNtd4p44/E0EKXB4ulU7hu0pcAM7rTlTLodg8dY7CRSt2SvdZaE+wySkuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kJnEIdXO; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kJnEIdXO"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c7212836bso12623766c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 15:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776812391; cv=none;
        d=google.com; s=arc-20240605;
        b=cWEPZVSIqg0tXrMbYM0iIoy9J139jPf2sfwGEhDZ76FXpVgTjmi8afDEI9UbbfwTid
         2b/CLn9g/vyD3v/jnPXmmIBH7x6cMPc3GuOqjQ5/xyILHUuKn800rBuTnmypx6cMOJN8
         LcFMaabVlCjiVMwfGH8h2XEudIF7Bi26c1lIxjJ0WZQLLMnx9bLjEOF79MXvomqyXJ86
         diYPoWKl5neh+lDl2ZFZgE72YKS9M8JzWTkj/lNPVDJnQPGfy/Q1tZLy9Iit3Htvw7Ce
         OBJumywpRKICuuLJCT6FdmzLjcuT6Lo8Cmc++eBsnkX63JSsrCYxb3L5P4DFua6CWVTB
         k2sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EUyujIAApUVAkDEH0uSDEg04wL17CBrnWRgJpkrkKwA=;
        fh=iY/R8sr4soBT+Uq4C5ZtC0IcDHxWMsHKAkE0YcUY/d8=;
        b=QHfN6s9/Cu/AG5TG54bqaRw8zFVJRbND2aQCcaonrgKwqBOyhpUS/1Nb63Vs9aIVn7
         GRJVzmM9/pFXvrgz1WLbAfV4HkPZY2SlYrN05/lgGhX1DJ5F3td6ZVP5V5Fkdix+DPfL
         1WgoboSyBYs2kedjOFv1qbZnTB8ysvSaDe012xBcHoZcwOIH5AVluht1JnAWHTqENK6n
         Jbv7JjcNrRXdvn2MZOLlF/vajgs5U2Q9ogAJToE9Zqqh2p0koR+B7FYeuIu91NCGtxRw
         g/E+euJ/njwqzXp4r/YAbgESi8AXTwUHkLt+EerJM/gCa4/ZloNM3SJOeWdzS30k4Yz4
         GZWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776812391; x=1777417191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUyujIAApUVAkDEH0uSDEg04wL17CBrnWRgJpkrkKwA=;
        b=kJnEIdXOSNh5El6j8Cqf8cZQDH0EsSIFvXhpT1bMNNqRKxB73DY+SOpdx33agney4Q
         qbxoyNQ+YyyZcBloPQN2hF2nzIqGMEVRqnD3jU5VaqYIolVbKrtYj4ILdfy1sgqxanTz
         mX91nn/T6xuR7hD2PLwpr4qxKm5TpEZyFZ8LuTnezZBy/AWm4ASgMfSNDBoU1sZw+t+k
         lR3MqLoT4OwFn2fCd3qnH4kxQiGx9+BfbRng0oiknMFjiJ3NATFyd1K496VpVMp4W0a0
         eIpB2UHFW+sjPdMmsIEwNa+NeMtj8Vkh3ZllKJ7ChtjxM0XK5F1EyeRr4X3m72rJQVp5
         O1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776812391; x=1777417191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EUyujIAApUVAkDEH0uSDEg04wL17CBrnWRgJpkrkKwA=;
        b=ADJRy5Zw/jbJxkk9v2gvplhXNSFfo9v+AtEQFkB9/nbjLyzKh3DwlJrNPwYx0ReT9g
         EcfyiF+1j+a3Vjf6ZiCDrHUsO//y7hOdPOB9GUZ+gIFeiVyXzfRq5CrgdzHKBYZw7UBe
         E5HsMtFzT5rnBUv8ttrPxMxzdCQFH6031IUZTfkSZ5fsKHNj8l5ov74b4qfBAtCLt8c+
         jCGghJlaXabxFi34ZCr282Z6Q/HZykRV44pa4ibGS2eHjAlRfySa4PN1aXG9FLGOJeea
         bfsHP2ZHg+oGxo6aTX8ockSJf+li8ynRc+xkhwomPQWu7f4Al5rRq/D5XeTMsoyKbtkJ
         Ao/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/DjjvF0cQ9IDgxOitXz/Rl1sPtXKqe3CV06tZ3TQm2WIOkFDDKAQ9aot0gz8AZO9eL78e0r6w+Hc0LZf4qrk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAmGqu4ppAoLYNRBiQWo/bReUHllROjgZVt5FY3FsGamLwk6uT
	z3GTgrko0/kWAN86I+M+G7jc6oKmSGdArjkCXn+um1vDZk+h5Fsjl9g7Upg+44Tz4pa1HTkD4xG
	orUkLVTfvoH16jGVqqyiZO/kIi2otZL6FdiEXKJIn
X-Gm-Gg: AeBDietlWIeqMW7glNDbjdKwRT6ty4Q9d9d8dgRS4H15SQaJA4LSOIX4/DsT6a09/cH
	Zx6mwlHIiD4xIMFwcqA7ueNfAeB3ZbX56TFrSL6LyPqYgr7848K+ip/tJwwK8Uuhx/n1I4eppHh
	H1emVCkyb5UTZ4cPYPqmbdwBoXQjtNS+igpgc5oEbg74+ZADh4BuWR/vDwY+zwsRfQoNEIGttZn
	J0pp7WG3SSHRisdf+taxqrUB0EbCSoJ/+QGW8mLp/cXkyyWXi9BLKREJvRRB2EnHUhNPUS3tSA5
	kZD34ODaqW7e2smTRfmctj/NExvaVmIp6ViYava/i8tH86ep5Bi6md2oeCDBAJfuldLVXz0UD1C
	krTsAOGjSQcBc0U14gKGDen6SCN+x1cnHRQqe/gASAJJMBTOk4euXV8OMk/aqlkYEkY8wLGC5fQ
	==
X-Received: by 2002:a05:7022:60c:b0:12a:713b:8958 with SMTP id
 a92af1059eb24-12c73f7596bmr10068832c88.10.1776812390229; Tue, 21 Apr 2026
 15:59:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421123106.142299-1-jt26wzz@gmail.com> <20260421123106.142299-3-jt26wzz@gmail.com>
In-Reply-To: <20260421123106.142299-3-jt26wzz@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 21 Apr 2026 15:59:39 -0700
X-Gm-Features: AQROBzD2IEw4ypAL697CZLXFoPfbIAflmemsvJ5os_4y8LuiwAgFAJA40Z9E2X0
Message-ID: <CAAVpQUDv28sNCYdo6oH25FNKnddZibwrmxMUf4GqgS4fRA8+og@mail.gmail.com>
Subject: Re: [PATCH net v3 2/2] selftests/bpf: check epoll readiness during
 reuseport migration
To: Zhenzhong Wu <jt26wzz@gmail.com>
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com, 
	davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, tamird@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 5:31=E2=80=AFAM Zhenzhong Wu <jt26wzz@gmail.com> wr=
ote:
>
> Inside migrate_dance(), add epoll checks around shutdown() to
> verify that the target listener is not ready before shutdown()
> and becomes ready immediately after shutdown() triggers migration.
>
> Cover TCP_ESTABLISHED and TCP_SYN_RECV. Exclude TCP_NEW_SYN_RECV
> as it depends on later handshake completion.
>
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: Zhenzhong Wu <jt26wzz@gmail.com>
> ---
>  .../bpf/prog_tests/migrate_reuseport.c        | 46 ++++++++++++++++---
>  1 file changed, 40 insertions(+), 6 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c b=
/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> index 653b0a20f..6180a79a7 100644
> --- a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> +++ b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> @@ -7,24 +7,29 @@
>   *   3. call listen() for 1 server socket. (migration target)
>   *   4. update a map to migrate all child sockets
>   *        to the last server socket (migrate_map[cookie] =3D 4)
> - *   5. call shutdown() for first 4 server sockets
> + *   5. for TCP_ESTABLISHED and TCP_SYN_RECV cases, verify via epoll
> + *        that the last server socket is not ready before migration.
> + *   6. call shutdown() for first 4 server sockets
>   *        and migrate the requests in the accept queue
>   *        to the last server socket.
> - *   6. call listen() for the second server socket.
> - *   7. call shutdown() for the last server
> + *   7. for TCP_ESTABLISHED and TCP_SYN_RECV cases, verify via epoll
> + *        that the last server socket is ready after migration.
> + *   8. call listen() for the second server socket.
> + *   9. call shutdown() for the last server
>   *        and migrate the requests in the accept queue
>   *        to the second server socket.
> - *   8. call listen() for the last server.
> - *   9. call shutdown() for the second server
> + *  10. call listen() for the last server.
> + *  11. call shutdown() for the second server
>   *        and migrate the requests in the accept queue
>   *        to the last server socket.
> - *  10. call accept() for the last server socket.
> + *  12. call accept() for the last server socket.
>   *
>   * Author: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
>   */
>
>  #include <bpf/bpf.h>
>  #include <bpf/libbpf.h>
> +#include <sys/epoll.h>
>
>  #include "test_progs.h"
>  #include "test_migrate_reuseport.skel.h"
> @@ -350,8 +355,28 @@ static int update_maps(struct migrate_reuseport_test=
_case *test_case,
>
>  static int migrate_dance(struct migrate_reuseport_test_case *test_case)
>  {
> +       struct epoll_event ev =3D {
> +               .events =3D EPOLLIN,
> +       };
> +       int epoll =3D -1, nfds;
>         int i, err;
>
> +       if (test_case->state !=3D BPF_TCP_NEW_SYN_RECV) {
> +               epoll =3D epoll_create1(0);
> +               if (!ASSERT_NEQ(epoll, -1, "epoll_create1"))
> +                       return -1;
> +
> +               ev.data.fd =3D test_case->servers[MIGRATED_TO];
> +               if (!ASSERT_OK(epoll_ctl(epoll, EPOLL_CTL_ADD,
> +                                        test_case->servers[MIGRATED_TO],=
 &ev),
> +                              "epoll_ctl"))
> +                       goto close_epoll;
> +
> +               nfds =3D epoll_wait(epoll, &ev, 1, 0);
> +               if (!ASSERT_EQ(nfds, 0, "epoll_wait 1"))
> +                       goto close_epoll;
> +       }
> +
>         /* Migrate TCP_ESTABLISHED and TCP_SYN_RECV requests
>          * to the last listener based on eBPF.
>          */

Sorry I forgot to update return -1 to goto close_epoll
when shutdown() fails.

Otherwise looks good.

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>


> @@ -365,6 +390,15 @@ static int migrate_dance(struct migrate_reuseport_te=
st_case *test_case)
>         if (test_case->state =3D=3D BPF_TCP_NEW_SYN_RECV)
>                 return 0;
>
> +       nfds =3D epoll_wait(epoll, &ev, 1, 0);
> +       if (!ASSERT_EQ(nfds, 1, "epoll_wait 2")) {
> +close_epoll:
> +               close(epoll);
> +               return -1;
> +       }
> +
> +       close(epoll);
> +
>         /* Note that we use the second listener instead of the
>          * first one here.
>          *
> --
> 2.43.0
>
