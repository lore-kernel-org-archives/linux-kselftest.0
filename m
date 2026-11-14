Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794673381;
	b=zI0+0v7Kjk+dEz2iQPXebtV0t2w0BT2lXPDl0JFo2ihvgR5Zpr6MThiF7teMrhu/qYvW
	 QM6PH9M82NxA5YX0x/gEZVr7OP4Y/2gy994nd7RKgEiHbLtjNsoSlweMR1c1j3ocmuPLS
	 ZCOAOJEQ/UkFsjJTHEHb/MwnI2pDN+Eiumc+fQyl0JBp3cn3d6kj4nGSSscbtXf6ASV/F
	 wa7FxMcFbt3WGBxaTIA9xLg6a/SePHyd5ZsqoVWnuoaAykrkQgDoyjbMNpQxC/62HHCYA
	 08Yn/OfrjhQmj4btvOL9yq6FD881bEhVtUsoePtmWuYyp5CNqubgKLG6PERBoQKGyOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kIrdsg15x4joWnwi7mHS0sRF/D5IlopS+RsU+PycYPQ=;
	b=rw3MpHKMhTitTTQO//Kw48k19Vz1aADKQdLLVMLZVUDycJ3tJbpiO1T2pMZ9Tlb8j66w
	 dcaBDBm6GEKhV9PnF95nRvXBuzHiL75nBAZAbmMV8fS7lVdtC18dk/GqAhHR8n5D2JSC4
	 N021G/Rx9oh4XPilm4CfkPVvos1v+3Pb+dud3yKLWUwslkzwzZXeKLzoBYmd25iIY13Qd
	 pLWjYdDKNTZ28jB1c2oiPDDsfFYXFZwMdjNHChOL12gBC/vQmDCdjqkSpP6DySulwl6GG
	 26upw5Z4RKp4e32SCTqrwOiI+sbbm5HkwiD+ziws8rO1et/TqrIhRg3HDfxfmNyUEWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=APdQoQCw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1B2606A32D
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 16:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B1B2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=APdQoQCw
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67990a45e02so2119210d50.3
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 08:23:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794673380; cv=none;
        d=google.com; s=arc-20260327;
        b=SGpiIWDJ0VXL3IgwOTNKgqylwsyH+fkxO5LcTZ4/mLumMnPBA9ukZqkOwHjFDFUtSz
         HE+gKbyGqXBYbkVTZiVzAcqd9PRPcS/WDK9FqR8M7e50Y76N2/e+F4031q/lZT3yARt/
         KgTE5FH7/rIwofgteIItOUmp3BS/lN3zh/rTFfK+/NA98f+RGGBZeu7aWesGI+x3Lbja
         sjZEb0OOuwRPeT6t8Vk4/rs7UFQG20TBKHM172OGscQk4bxmKKiJ65I24GH7g0JhloZf
         u443vw4Z++VQiPXoKgX0IGEuU3kMHzLLcyxE62VEVQYLnQi65HjnlmyuN7b295jV/lwJ
         7XEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kIrdsg15x4joWnwi7mHS0sRF/D5IlopS+RsU+PycYPQ=;
        fh=eGmPkvS9CgYH7ro38XCdGqecx23kGtGeYC5civWf23s=;
        b=IS1eDmyG6q8mah2YODzaw4br2nePGvTJ3NlAgu6G/mtCmJKeInm4z5WQi7k3FBzgqe
         ofNdunfjARUMB0Tk9mY8Ec57E49ieNbucUFEQFlVa1MMjKpwFLSRtom4H/i3wOC7kD0E
         ZC9Ls3pDOkbjUiqmH1rIpYO9TnPCSMlnxsBQii2tZvKyvqHGpcwwbBQGLZiIzQguBgjs
         M2LalzuDUwPDyOnlDLb954CEjp1Bjs7sz/SGGfkV2jbh1KN1yKqxccgakajGorKV7W8j
         /jcfkAQ02P+UYhhL5yIwU+JGAKRaW5h5tqsH7U18R3cgZlPkxBLRGajF/XaA5EkWzGJd
         Hz4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794673380; x=1795278180; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIrdsg15x4joWnwi7mHS0sRF/D5IlopS+RsU+PycYPQ=;
        b=APdQoQCw4TyQgXX7302jy7sKpUOemBZ4YzjW5ZzZnDAbAXo2VYfez9gb2Z2Grl83Fz
         W3FFJxdzWvNY/LaiEUZtO1N9KaNikO+ws3FBIDmAJqOc27WoUMdtoOYO7JtMFGM0X+yg
         b76rLyjPDHMRxfSSFHCbo5VnFgW7kLgJRoHcJSi/1e11d1PyNXb1mgeRTZu93dOJQVmJ
         3igUdwJ2oiTJdZ9KOu5ZALJemocETQ/4NTyLnr+yxNd4TeqeWBDWX3dLyRFjnNZC31lO
         simp0koL5wenXBnHoooIMg08JPKufYY/c0sdBByBFAY6GvpF87jSGiiJQN4ynN4xSmXN
         fDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673380; x=1795278180;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kIrdsg15x4joWnwi7mHS0sRF/D5IlopS+RsU+PycYPQ=;
        b=irXjRtTFZbVK5JDF1QuIkGArvJktCz+nvkuj6EkETHwRDfbk6FEsSuXU8Hp3YtKVg2
         d3EEmjpOYYgQp+lMk4xxmzcv/bUAmyvEnnPXCwMz5soxG/n0GZ7NK4J3rHHi5LTosJVb
         IJM4VTR9hptP0ol2/7HO8Uqnvb8TwXCJplxUIawkQK1w1np5rOCbDZ8pjo9iwPCictRw
         bvaHZgo8OKBUzC0YZMf9h1eF+VNOcN0ixffmfRMFPobJ1JN0vMYl5WXF4fsiFJkP0kcC
         pfND0iLfV1/0KuUq+eG01521ZoMk5/gxxciMdo+U6uAj9tRk5sm0dwYSHNjqP8XXHl8n
         ov9w==
X-Forwarded-Encrypted: i=1; AL+hErE0uDvCKjOIEJFxvVEwqC6SANWKG1QVatHtcCRdCRHjZqi6B+FvK6eI8agODqrrav1i1J2apEjLT8+Giv0x8MY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p2HO15ftw2GbGPZoQSMg5R+lGNMxRONg+Fozs3v5lr7YYJPXd
	c4v+kvOc4dtxwqv/vHIJZkYA5HlXeXpItLzAVHIwcMebKmxyE4oIorOvmGDkAtHIrAtBFh81PAe
	xsZg02tbQUOAUcMy7YRxiMgaqAi4ySGg=
X-Gm-Gg: AYBFou370dOmmwbza2mGHF9K8xEy7Uwio78us1ZEr9Dnf+BrmYuaJoP7SHf+1nBwBfE
	Ew1HlMLHzW/bRiu0NFEngqLZoM+9hbJwghSvXIiRyxgPfPYBYny/JTxnTvs1R2prRAVenxXsbRJ
	jTXR8BXpDuiTQ4HXGqGJbGVMEbUPGDrUD+D5n9fEHaC2WwUKeUvSmT0l2YSVl2OrGaZhDgbg1yW
	+DiQCodts7UJ7nylv3+T2H/wKg6xcYVJdbGFU9Wylh/lxMJYGntr8fLZfo/DEYK6qJdBVY8vNxh
	csjWUsxuzbP2hQ/CtRxhPBghgF++QvVzWpwWGo4HVyc/4F+t6aoxg8lkbyElyvQNi5c1XcrbqFV
	j+JwdxCs1qqOYZQ/uNv+MLVEfE9C1R6VAqESLW61EPMNoOPWsircxx5D5z4mLAKHcZ8kz6rP4ew
	zk1cHtHeiWkC1VZPqgHrPh18VX2rmGrfMiaVpuhq+EGbwfT5Srw7YMGe8yIQHbffCYiA4yy4NZT
	ozmBCi1PfjOfGKnhSV19ntSdArT3tw=
X-Received: by 2002:a05:690e:1917:b0:675:a278:10a4 with SMTP id
 956f58d0204a3-67d89888ea5mr3886121d50.103.1794673380065; Sat, 14 Nov 2026
 08:23:00 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111225148.88506-1-sidchintamaneni@gmail.com>
 <20261111225148.88506-3-sidchintamaneni@gmail.com> <avgQgQeWDfQMQgvl@google.com>
In-Reply-To: <avgQgQeWDfQMQgvl@google.com>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Sat, 14 Nov 2026 08:22:49 -0800
X-Gm-Features: AclHuK_8gEV-etDhqKooisr3RfW8V3KHVl580Th2LAmWabQ5EUshcJqxA7SCoT0
Message-ID: <CAE5sdEgGjK0x3QuetQaTycmtxUMwFf1aQChXyrQxZUkbX6uO6A@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftest: af_unix: Test scm_fds on dgram disconnect.
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Kirill Tkhai <tkhai@ya.ru>, apais@microsoft.com, 
	hargar@linux.microsoft.com, rlmenge@gmail.com, egoriluk@gmail.com, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 23:53, Kuniyuki Iwashima <kuniyu@google.com> wrote:
>
> On Wed, 11 Nov 2026 22:51:48 +0000, Siddharth Chintamaneni wrote:
> > Add dgram_disconnect_fdinfo in scm_rights.c verifying that scm_fds in
> > /proc/self/fdinfo/<fd> returns to 0 when a connected SOCK_DGRAM socket
> > with queued SCM_RIGHTS datagrams disconnects via connect(AF_UNSPEC) or
> > observes a dead peer in send().
> >
> > Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> > ---
> >  .../selftests/net/af_unix/scm_rights.c        | 79 +++++++++++++++++++
> >  1 file changed, 79 insertions(+)
> >
> > diff --git a/tools/testing/selftests/net/af_unix/scm_rights.c b/tools/testing/selftests/net/af_unix/scm_rights.c
> > index c165f250220a..ced83d3173b7 100644
> > --- a/tools/testing/selftests/net/af_unix/scm_rights.c
> > +++ b/tools/testing/selftests/net/af_unix/scm_rights.c
> > @@ -395,4 +395,83 @@ TEST_F(scm_rights, mixed_lowpoint)
> >       close_sockets(6);
> >  }
> >
> > +static int count_scm_fds(struct __test_metadata *_metadata, int fd)
> > +{
> > +     char path[64], *line = NULL;
> > +     int scm_fds = -1, ret;
> > +     size_t unused = 0;
> > +     FILE *f;
> > +
> > +     snprintf(path, sizeof(path), "/proc/self/fdinfo/%d", fd);
> > +
> > +     f = fopen(path, "r");
> > +     ASSERT_NE(NULL, f);
> > +
> > +     while (getline(&line, &unused, f) != -1) {
> > +             if (strncmp(line, "scm_fds:", 8))
> > +                     continue;
> > +
> > +             ret = sscanf(line + 8, "%d", &scm_fds);
> > +             ASSERT_EQ(1, ret);
> > +
> > +             break;
> > +     }
> > +
> > +     free(line);
> > +
> > +     ret = fclose(f);
> > +     ASSERT_EQ(0, ret);
> > +
> > +     return scm_fds;
> > +}
> > +
> > +TEST(dgram_disconnect_fdinfo)
> > +{
> > +     const FIXTURE_VARIANT(scm_rights) variant = {
> > +             .name = "UNIX ",
> > +             .type = SOCK_DGRAM,
> > +     };
> > +     FIXTURE_DATA(scm_rights) self = {};
> > +     struct sockaddr addr = {
> > +             .sa_family = AF_UNSPEC,
> > +     };
> > +     int ret;
> > +
> > +     ret = unshare(CLONE_NEWNET);
> > +     ASSERT_EQ(0, ret);
> > +     ASSERT_EQ(0, count_sockets(_metadata, &variant));
>
> nit: count_sockets() is not needed.
>
>
> > +
> > +     create_socketpairs(_metadata, &self, &variant, 2);
> > +
> > +     /* 1. Disconnect via connect(AF_UNSPEC) */
> > +     __send_fd(_metadata, &self, &variant, 0, 0);
> > +     ASSERT_EQ(2, count_scm_fds(_metadata, self.fd[0]));
> > +
> > +     ret = connect(self.fd[0], &addr, sizeof(addr.sa_family));
> > +     ASSERT_EQ(0, ret);
> > +     ASSERT_EQ(0, count_scm_fds(_metadata, self.fd[0]));
> > +
> > +     /* 2. Dead-peer disconnect via send() */
> > +     __send_fd(_metadata, &self, &variant, 1, 1);
> > +     ASSERT_EQ(2, count_scm_fds(_metadata, self.fd[2]));
> > +
> > +     ret = close(self.fd[3]);
> > +     ASSERT_EQ(0, ret);
> > +
> > +     ret = send(self.fd[2], "x", 1, 0);
> > +     ASSERT_EQ(-1, ret);
> > +     ASSERT_EQ(ECONNREFUSED, errno);
> > +     ASSERT_EQ(0, count_scm_fds(_metadata, self.fd[2]));
> > +
> > +     ret = close(self.fd[0]);
> > +     ASSERT_EQ(0, ret);
> > +     ret = close(self.fd[1]);
> > +     ASSERT_EQ(0, ret);
> > +     ret = close(self.fd[2]);
> > +     ASSERT_EQ(0, ret);
> > +
> > +     sleep(1);
> > +     ASSERT_EQ(0, count_sockets(_metadata, &variant));
>
> Same, these two lines are unnecessary.
>
> sleep() and count_sockets() in FIXTURE_TEARDOWN(scm_rights)
> were to wait GC to purge cyclic references, but this test does
> not create that.
>

Thanks for the review! I'll drop both count_sockets() calls and re-spin in it.

>
> > +}
> > +
> >  TEST_HARNESS_MAIN
> > --
> > 2.43.0
> >
