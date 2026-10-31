Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793487258;
	b=XDGYbxSE4+VKTZ2cIlTuc60gzD8d5nkpsdMx2iBWMnH74LoW0czeZlrPIteokEeY3cf9
	 al+fzvpsak5tg+SMR23U20FRTvkVNeDMtAhGWSkiOjLa/tOd996XFR6rQbLiYvHjbqE1O
	 j3YdsHNulspLfYuKoVlyzIljxdreFJkZ5ETrbdHDbS/RK3QIIYteLUo03yf7kbQN9Wee0
	 AWRQ0FK7AEs+aWJ7B1JjzMvn+y7Q5AiLUkXhpd7uvqFRXi0zIqa5Fd18hZCVHDwvkviYl
	 UeASndhJy0gV/eVEKsaGnxgyRWvd4n56MG8YORHmMpdc41Ee6JS7SLMKJK2RgHpcKxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793487258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=Z8fT26vpsEDMPRnKW6QzA2H7dh87iXVUMOUV6O8C+50=;
	b=bjHUAM83dFMcqOZ/Qvf9XVxZFNpjp+oxFOdQ3q6cGuqrTvmdG/rv0XB2PJ7MFQAlsYJY
	 5bQEYLp+lUoySW7naPlfdcOQO0qVlnexGT3krGau0pQMGj5EDftXysksA8RoQG9FbHn/i
	 FRRoLcqLyyXsEWqrKDpvidEFyheSMbl7xXmRoqNhM7M3Ov2jMIOJU54YNqDQS8J6jpC6J
	 7ZrdJgT0Hp9AAYXVzyDhdsqF2MD215mIYnVrE4hS32c/cJ1iZ/H4EKHJlmS1TOIa+Zbvw
	 7MDXK8ziFsrK1Uinz+ew3U7ReQh9MckBNNhQiY8MXIPTISdMvK2js6FtNZfkJJnbuRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l9JH1JKp;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E95606A31D
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 22:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24E95606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l9JH1JKp
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1153660a91.0
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 15:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793487257; x=1794092057; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z8fT26vpsEDMPRnKW6QzA2H7dh87iXVUMOUV6O8C+50=;
        b=l9JH1JKpuOVnqRGAGQhCpCfSchc2IxTEi3pMPwwzzMEqR3/PIvkYpeO27x6B0Vpogr
         yV/4ngakbHpr64ceYOk0SfcPZ0jTojMWQ1QHPcKHJQ3lWT7Me7+HybFR69JETMEHl0OV
         2gGq8Rk18Kl3omz8dSXyGXA5vlpgS7GwY7SGdQk0lLgWB5pgG9tbuoD2izDXylRyTtlM
         ZovSOIARxZ2LaYy0AOszBYrQZxMEsGwelFfyhvLyE7CtU8tK1vE8n7vuYs0DG3m+tHeq
         HIVv5HxW/+rytqtBeaI9LTmCcxeTHMcuGglWT4iPos07jMLZSFtBpa07u4j3zlayTPqv
         ME+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793487257; x=1794092057;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8fT26vpsEDMPRnKW6QzA2H7dh87iXVUMOUV6O8C+50=;
        b=QXqtfC/LfcoJdY+vTygIlZ/VoDLd4pyWWMuyll0xb6pEZHe3dC1wn073idPi/pb6Kx
         vmk/wiXoJ2uD2PCcpgbb9jq3ynd6NnRIzn6yjRMiAzIzZN2kDkDT1Im42WupMBm8v6Uu
         OjiO1m64vcfmI+8hX15awK+uh0o4VLfhhsdBoZwax5at7raoOeNN1B1rqj1/XPD4Vvps
         PeMV2SoOV+pEdivcmJC9gNPlmd9VowDjJ/zV20VFtZ782E3mVTX8kuItI7U9lUlKk5n3
         KGlmEDRBAWc2GXUCR3d/DKDQ5RUagrR32CFnjcg9TTy9RS2NzmixCZiAvVZMk7ByLGQK
         4Rpg==
X-Forwarded-Encrypted: i=1; AKwUvBxt0bpfLzrYm786SWcSBiKOvnQp+r0q/AK1DmqjKPIcJKXzCHYej9uA8J+MxGAHp4y/H/deLHp/QgX7KdmJduc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbMBlll+zT6XGaO/w6g2+x+na6N29MDyXpw8wrksvfW0P99jtK
	Zqc06UTl9QrfP+iYJvn7a/RfxlPUBMxWLF/ml1Mm0iEgRh37AsRrATw4
X-Gm-Gg: AYBFou1v/9ULPvvmcpCmaGjaHTwtH8EbWQRJc9yYdBi6geZYXkj3L8sREmXtSOiLbIn
	tUOwYLbMVE+N0Qzx2R7hljG4cC4JPbpwpwgv7FaNcl0Cd/A1RAlSduZO3uDdzvNgRMl/ZcW94RO
	u67vrfeeAWtjirlpJX/2M5BaVAM+GXHxt41zPjaZfO23k5A2aDCfg+Y14AHGYXC/EZj3NiASO9T
	dXH3iB1+07GfieVq7TQcB37wItlbJj9X17+JKEtkcLpkqMAdNXl5pqaf7azZuRfxLgbspIFWo5z
	UKwMWPQQsZswu58FP1VWb8E6E7YQ5jZO0tjXn9uyc7YJ41cpWpgONttpk0fpfuCSv4i4aMr7+pW
	+SDlRC2JUoLPQ02m4fV9KfuFIXh5Vl5QBmjB50zKCSdfbriA9hRIZYQr57e1baCQGjZqZ62RGNJ
	MUeRLXX4TrtO5b3smN+3wk9oUo7OhJ/HP5x60SR+g8WKs1Cnkd3LH4u6QBEA5zENC0M4p3iOUNM
	JOlX8iZJtcQuwEnr0SsewppLr58eD590LaWMhGLXZs2ax4+Evx7/ZuceTZ9H1AUDqjKj06bYBQs
	eWytRoxdthgTPDrLD+T+8n2wTIwzVcBlvJQeK1QTu8I7eBS+MEOOxzEfB2e6nS60wUq2Aso88B6
	5C/EbzUmrX/LLh4kHLGJyRzMXyk9XugL9FXiUeo3IlLoD+6l1FpFHyCo=
X-Received: by 2002:a17:90a:d2ce:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3ae897f36c6mr5382448a91.31.1793487257312;
        Sat, 31 Oct 2026 15:54:17 -0700 (PDT)
Received: from localhost ([153.61.198.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8805ebc8sm4636221a91.3.2026.10.31.15.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 15:54:16 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 22:54:16 +0000
Message-Id: <DMJE6776F9F0.1O5A9ZMKWYEUP@gmail.com>
Cc: <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next 0/2] selftests/bpf: port test_ftrace.sh into
 test_progs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Daniel Borkmann" <daniel@iogearbox.net>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>
In-Reply-To: <20261030-ftrace_in_test_progs-v1-0-aa50c5dd1ccc@bootlin.com>
References: <20261030-ftrace_in_test_progs-v1-0-aa50c5dd1ccc@bootlin.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Oct 30, 2026 at 11:50 AM Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com> wrote:
> - commit 1 brings a few new helpers to manipulate ftrace from test_progs
> - commit 2 performs the actual porting
[...]
>  5 files changed, 412 insertions(+), 46 deletions(-)

This is quite heavy for a port of a 44 line script.

Lets use a tracing instance. function_graph works in instances.
An instance has its own set_ftrace_filter, current_tracer and ring
buffer. rmdir undoes all of it.

What goes away:

  series                          tracing instance
  ------------------------------  ------------------------------
  global tracefs files            files of the instance
  save and restore, patch 1       rmdir
  serial_                         not needed
  all functions are patched       only the filtered functions
  new progs                       progs/modify_return.c as is

modify_return has fentry, fmod_ret and fexit on the same function
and checks the return values.

The removal of test_ftrace.sh stays.

Instead of patches 1 and 2:

diff --git a/tools/testing/selftests/bpf/prog_tests/modify_return.c b/tools/testing/selftests/bpf/prog_tests/modify_return.c
--- a/tools/testing/selftests/bpf/prog_tests/modify_return.c
+++ b/tools/testing/selftests/bpf/prog_tests/modify_return.c
@@ -61,3 +61,28 @@ void test_modify_return(void)
 		 0 /* want_side_effect */,
 		 -EINVAL * 2 /* want_ret */);
 }
+
+/*
+ * The same test while function_graph traces the same functions.
+ * A tracing instance has its own filter, tracer and ring buffer.
+ * rmdir() undoes all of it.
+ */
+void test_modify_return_fgraph(void)
+{
+	char dir[128];
+
+	snprintf(dir, sizeof(dir), "%s/instances/bpf-XXXXXX",
+		 access("/sys/kernel/tracing/trace", F_OK) ?
+		 "/sys/kernel/debug/tracing" : "/sys/kernel/tracing");
+	if (!ASSERT_OK_PTR(mkdtemp(dir), "mkdtemp"))
+		return;
+
+	SYS(out, "echo 'bpf_modify_return_test*' > %s/set_ftrace_filter", dir);
+	SYS(out, "echo function_graph > %s/current_tracer", dir);
+
+	test_modify_return();
+
+	SYS(out, "grep -q bpf_modify_return_test2 %s/trace", dir);
+out:
+	ASSERT_OK(rmdir(dir), "rmdir");
+}

pw-bot: cr
