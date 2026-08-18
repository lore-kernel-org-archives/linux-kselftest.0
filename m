Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378392BF3F3
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 23:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787095564; cv=none; b=XhXkjwewMJC9fhVmmzci3aViIBZBVGWkjXeDbzvzd7rCRVXmhakdPc2fdfFkZsnsjW6txoiXwt4dJa97cPPo6DY164nmxaXJupXWxyfZVpLkCSIWJUhYEvOQ0/ZBA/IhXsHMXdzKF78sFdCUIkF/1/KJt7Zik4S4eIkQdgtthQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787095564; c=relaxed/simple;
	bh=e6ndFhgPut4OMuMojKDPvfYXSEtrB68z8W/+iyMwO+U=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=MTXM7eTI5WQeqwyd/gBLVi8oRom/SMexFXsthclSU8dpY8KpqhOt7IE604O+QNPBscs3QJvuHEYQk3Tp16WprWh/cAdIdW5maqWv5Y0HIxaXiV/0gKV9EXZMTTkdf6xrOQj4DCxOe7oqG3UDu/y/U+TYNNrcUqnrROLyjESQfdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=MVUaiosa; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="MVUaiosa"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so628529a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 16:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1787095562; x=1787700362; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jztQZP2aqNb9XCCcLuBxD5DTDOgUaHJEuB77MdCft9I=;
        b=MVUaiosav1FHdlwiAsgKAS3544vAwi1buY3jtXckrEmnQ1qhEWn9ozW5TGC6W4j6Lk
         hBV5X9QJWHBx1saVx/rtm73SWgvU6hNBQ0xPOJA9AYMMDms3QhXg9FQiK8H2FNwSZz0n
         biblO6h6yPvidhg0jD0+EKEMFbTEUSu0M2g+Hqiu8raXSt7JJV1nvEFyeG9c67hKB4Xh
         Kv3roiFtSTORulWWAMF6XcdwfGc3du2o5Fr7xRDpJmAByM7wxzEBDh4br8aiTkFph8GN
         zHOL3mEyWHJmXA8NqZOsstRFK8yA2NrCGRyVHRgn1INrYL4kJ3BaDVCdULkI+9omi7RC
         YcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787095562; x=1787700362;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jztQZP2aqNb9XCCcLuBxD5DTDOgUaHJEuB77MdCft9I=;
        b=q3jSwJcD7xcV5yJ5uZ1w8A0zzcIRPX+SwUogyBhpchpxAVVExWnyQRFgLoyocFnR3+
         H0sttmL5GOVJTMrGYW4OPX/jjcA4If2joo/0To6meL09sI9UdpxIRIMxqD/Ldc4jw9k0
         rbS+NfEZ4UYGjB79y4SRUaRZnrCsCAQQ7KbwVo7ZpSCwEnCy2Xeo4ptAiPwpoOPwoNKn
         jz1Pb53K4BU+zs0rWdY66y0B0/mM8qQR4e6wb0APoJQnFE9tW8zHB2RP35p3rweidvxD
         aGSc2+lrKjcEHrptAU2GDclbkjY80MxkVxR/i+dIPK0h7JmxQNSYnm+9+0ffQSRtI7Q+
         5ESw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/AZEBmn1kJ047R6w5+mEQCrJjAm+wMcqiJn/q6eddezAcD+ra35x7kLvqHf0c0aFIgxBeXMTk+7hLfHzw+A4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgghuHVWU0KKkrJm056cm63FG0MGJu4n8+CxFC49pQnB2Skclo
	Qn880SeLmSEE6ZwT43MpGmweUs3FifMa+IUXVKr8YlXG/iXEJYJN/ijg3+YQP98ZzXA=
X-Gm-Gg: AR+sD10ASHniZXlODMMzkxDjmB/kupPaw7iHxAi4se3b9/SYHHx57lmQvvdLDtry8bq
	AKGDafElvNgEWNKsjLBH/PvEZRxtKHehKhifa5TikXQWBVvhHmvs9fk5VB1yMm/nl706BpJLAK5
	Xxl4UjicMWp+wQtbBfzAZ0oVtsJBUcuXzLP6/G4fv+w8gKeFxSvrumFUVXl2Obav52pl5P5XKMd
	NnafKeV1Kxz/BjeqJCHLGOO/unEKxWSpkQg5ch/ZST6YpoNOJn6RxfXU3FD598xUSlLcKWU//ft
	iZ6MxUOPS606gy3P/bpcj1ODUmPjhPPceXOW5PZc7CgBRXAHgaJ+KT0lAuDDQcgnzQkNe1V5bgr
	cbsTNE4ZMophNvpmN/x8LPoS84DISzFNzkIvMc2atrZu1CReptKFUJ8saXTmt2cRLQL7LG+8HVS
	3quOrBLhfGv1gugeROlmtsI/POf7M5hVMEKzmyazFoJPFF3G19JfHhfUU95VeY3GCJF78uuF409
	tYSXdha0vME7dPyiZZ5YbwlHGUs
X-Received: by 2002:a17:90b:5484:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-3958110cfc4mr767267a91.9.1787095562358;
        Tue, 18 Aug 2026 16:26:02 -0700 (PDT)
Received: from localhost (107-190-31-17.cpe.teksavvy.com. [107.190.31.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f85cdddsm115192a91.3.2026.08.18.16.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 16:26:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 19:26:00 -0400
Message-Id: <DKSGI6P7W52Z.3KO3SK2SG7EHG@etsalapatis.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "John Fastabend"
 <john.fastabend@gmail.com>, "Shuah Khan" <shuah@kernel.org>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, "Clark Williams"
 <clrkwllms@kernel.org>, "Steven Rostedt" <rostedt@goodmis.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH bpf-next v3 3/4] selftests/bpf: Add read_cgroup_file()
 to cgroup_helpers
From: "Emil Tsalapatis" <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260808140720.293604-1-jiayuan.chen@linux.dev>
 <20260808140720.293604-4-jiayuan.chen@linux.dev>
In-Reply-To: <20260808140720.293604-4-jiayuan.chen@linux.dev>

On Sat Aug 8, 2026 at 10:05 AM EDT, Jiayuan Chen wrote:
> cgroup_helpers has write_cgroup_file()/write_cgroup_file_parent() but no
> read counterpart. Add read_cgroup_file() and read_cgroup_file_parent() so
> a forked child can read a cgroup file (e.g. memory.current) from the work
> dir owned by the parent that set the environment up, without hand-buildin=
g
> the /mnt/... path.
>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

The "- 24" is questionable, but it's already all over the file. We can
clean it up separately.

> ---
>  tools/testing/selftests/bpf/cgroup_helpers.c | 67 ++++++++++++++++++++
>  tools/testing/selftests/bpf/cgroup_helpers.h |  4 ++
>  2 files changed, 71 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/cgroup_helpers.c b/tools/testing=
/selftests/bpf/cgroup_helpers.c
> index 45cd0b479fe3..4183ff6150c2 100644
> --- a/tools/testing/selftests/bpf/cgroup_helpers.c
> +++ b/tools/testing/selftests/bpf/cgroup_helpers.c
> @@ -188,6 +188,73 @@ int write_cgroup_file_parent(const char *relative_pa=
th, const char *file,
>  	return __write_cgroup_file(cgroup_path, file, buf);
>  }
> =20
> +static int __read_cgroup_file(const char *cgroup_path, const char *file,
> +			      char *buf, size_t len)
> +{
> +	char file_path[PATH_MAX + 1];
> +	ssize_t got;
> +	int fd;
> +
> +	snprintf(file_path, sizeof(file_path), "%s/%s", cgroup_path, file);
> +	fd =3D open(file_path, O_RDONLY);
> +	if (fd < 0) {
> +		log_err("Opening %s", file_path);
> +		return 1;
> +	}
> +
> +	got =3D read(fd, buf, len - 1);
> +	if (got < 0) {
> +		log_err("Reading %s", file_path);
> +		close(fd);
> +		return 1;
> +	}
> +	buf[got] =3D '\0';
> +	close(fd);
> +	return 0;
> +}
> +
> +/**
> + * read_cgroup_file() - Read from a cgroup file
> + * @relative_path: The cgroup path, relative to the workdir
> + * @file: The name of the file in cgroupfs to read from
> + * @buf: Buffer to read into, NUL-terminated on success
> + * @len: Size of @buf
> + *
> + * Read from a file in the given cgroup's directory.
> + *
> + * If successful, 0 is returned.
> + */
> +int read_cgroup_file(const char *relative_path, const char *file,
> +		     char *buf, size_t len)
> +{
> +	char cgroup_path[PATH_MAX - 24];
> +
> +	format_cgroup_path(cgroup_path, relative_path);
> +	return __read_cgroup_file(cgroup_path, file, buf, len);
> +}
> +
> +/**
> + * read_cgroup_file_parent() - Read from a cgroup file in the parent pro=
cess
> + *                             workdir
> + * @relative_path: The cgroup path, relative to the parent process workd=
ir
> + * @file: The name of the file in cgroupfs to read from
> + * @buf: Buffer to read into, NUL-terminated on success
> + * @len: Size of @buf
> + *
> + * Read from a file in the given cgroup's directory under the parent pro=
cess
> + * workdir.
> + *
> + * If successful, 0 is returned.
> + */
> +int read_cgroup_file_parent(const char *relative_path, const char *file,
> +			    char *buf, size_t len)
> +{
> +	char cgroup_path[PATH_MAX - 24];
> +
> +	format_parent_cgroup_path(cgroup_path, relative_path);
> +	return __read_cgroup_file(cgroup_path, file, buf, len);
> +}
> +
>  /**
>   * setup_cgroup_environment() - Setup the cgroup environment
>   *
> diff --git a/tools/testing/selftests/bpf/cgroup_helpers.h b/tools/testing=
/selftests/bpf/cgroup_helpers.h
> index 3857304be874..d42d2e13044e 100644
> --- a/tools/testing/selftests/bpf/cgroup_helpers.h
> +++ b/tools/testing/selftests/bpf/cgroup_helpers.h
> @@ -15,6 +15,10 @@ int write_cgroup_file(const char *relative_path, const=
 char *file,
>  		      const char *buf);
>  int write_cgroup_file_parent(const char *relative_path, const char *file=
,
>  			     const char *buf);
> +int read_cgroup_file(const char *relative_path, const char *file,
> +		     char *buf, size_t len);
> +int read_cgroup_file_parent(const char *relative_path, const char *file,
> +			    char *buf, size_t len);
>  int cgroup_setup_and_join(const char *relative_path);
>  int get_root_cgroup(void);
>  int create_and_get_cgroup(const char *relative_path);

