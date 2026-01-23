Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D0A34D922
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Jan 2026 01:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769132548; cv=none; b=q9VAHAqeyvPM5dO1DLnDphs/LBnzfcgl9BBgsZbeGwIeoS3JU11XC3/zdk9cUQ4jgUmaufLubb6F/FJNbzkNG09uXWTyAoz3AcIZtbNAwfl/i+9iVA1466n8tTabcjaG+KHzMK75tQDPMweRqsyt4LmGb7BmQ7BGeKxsSSnTn9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769132548; c=relaxed/simple;
	bh=1jYCfNu2E99u9MI+Zrtb1OeT/4uF24Ygozh31Z2W9Lo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AkA347FbBjO5Ns5JXaRCqKEJIpwCDBI5KZoOIspQjh2Bp4sUHMgmx/XlcSPi7/NgSDjj1fiWGzEr1N69KzlVd0CS6iW9zSMHd2ycHOpNxr6ODcZ2qkIvHX5xP5gZxguzox7jFbYf2Iy7JQtLWlqZvuwc0d9ptQrheRQx0Wur8Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dVi5OMKZ; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dVi5OMKZ"
Message-ID: <d8f37588-2b7d-447a-ae4f-dc81e1b573c5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769132514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iGfcUAaWbMDiu8CMjALaFc9nVb/oZtC296G14BPTQ8A=;
	b=dVi5OMKZnN2En7ntGYp3qS0caDqEIYvqTphe3/sn0O/6gZuDkrOON6x7HgsoWD0jNsfpqz
	nY2Taz8iZn++LOsX49O3LO4I9yG+BA+fHUYPHgGiJ7JF40NxOBbjWm8h+2ML5vJ5pfvhLu
	FfQokaE1/T4ZFe5L/FnUYq/dDhcLujo=
Date: Fri, 23 Jan 2026 09:41:38 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RESEND PATCH bpf-next v6 2/9] libbpf: Add support for extended
 bpf syscall
Content-Language: en-US
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Seth Forshee <sforshee@kernel.org>, Yuichiro Tsuji <yuichtsu@amazon.com>,
 Andrey Albershteyn <aalbersh@redhat.com>,
 Willem de Bruijn <willemb@google.com>, Jason Xing
 <kerneljasonxing@gmail.com>, Tao Chen <chen.dylane@linux.dev>,
 Mykyta Yatsenko <yatsenko@meta.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Anton Protopopov <a.s.protopopov@gmail.com>, Amery Hung
 <ameryhung@gmail.com>, Rong Tao <rongtao@cestc.cn>,
 linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com
References: <20260120152424.40766-1-leon.hwang@linux.dev>
 <20260120152424.40766-3-leon.hwang@linux.dev>
 <CAEf4BzYuZsFC-DPhhzLcyFTahucHP59+6kAc0sooY2g+SqgrEA@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <CAEf4BzYuZsFC-DPhhzLcyFTahucHP59+6kAc0sooY2g+SqgrEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 23/1/26 08:53, Andrii Nakryiko wrote:
> On Tue, Jan 20, 2026 at 7:26 AM Leon Hwang <leon.hwang@linux.dev> wrote:
>>
>> To support the extended BPF syscall introduced in the previous commit,
>> introduce the following internal APIs:
>>
>> * 'sys_bpf_ext()'
>> * 'sys_bpf_ext_fd()'
>>   They wrap the raw 'syscall()' interface to support passing extended
>>   attributes.
>> * 'probe_sys_bpf_ext()'
>>   Check whether current kernel supports the BPF syscall common attributes.
>>
>> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
>> ---
>>  tools/lib/bpf/bpf.c             | 32 ++++++++++++++++++++++++++++++++
>>  tools/lib/bpf/features.c        |  8 ++++++++
>>  tools/lib/bpf/libbpf_internal.h |  3 +++
>>  3 files changed, 43 insertions(+)
>>
>> diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
>> index 21b57a629916..ed9c6eaeb656 100644
>> --- a/tools/lib/bpf/bpf.c
>> +++ b/tools/lib/bpf/bpf.c
>> @@ -69,6 +69,38 @@ static inline __u64 ptr_to_u64(const void *ptr)
>>         return (__u64) (unsigned long) ptr;
>>  }
>>
>> +static inline int sys_bpf_ext(enum bpf_cmd cmd, union bpf_attr *attr,
>> +                             unsigned int size,
>> +                             struct bpf_common_attr *attr_common,
>> +                             unsigned int size_common)
>> +{
>> +       cmd = attr_common ? (cmd | BPF_COMMON_ATTRS) : (cmd & ~BPF_COMMON_ATTRS);
>> +       return syscall(__NR_bpf, cmd, attr, size, attr_common, size_common);
>> +}
>> +
>> +static inline int sys_bpf_ext_fd(enum bpf_cmd cmd, union bpf_attr *attr,
>> +                                unsigned int size,
>> +                                struct bpf_common_attr *attr_common,
>> +                                unsigned int size_common)
>> +{
>> +       int fd;
>> +
>> +       fd = sys_bpf_ext(cmd, attr, size, attr_common, size_common);
>> +       return ensure_good_fd(fd);
>> +}
>> +
>> +int probe_sys_bpf_ext(void)
>> +{
>> +       const size_t attr_sz = offsetofend(union bpf_attr, prog_token_fd);
>> +       union bpf_attr attr;
>> +
>> +       memset(&attr, 0, attr_sz);
>> +       /* This syscall() will return error always. */
> 
> I'll cite myself from the last review:
> 
>> But fd should really not be >= 0, and if it is -- it's some problem,
>> so I'd return an error in that case to keep us aware, which is why I'm
>> saying I'd just return inside if (fd >= 0) { }
> 
> I didn't say let's just ignore syscall return with (void) cast and
> happily check errno no matter what, did I? Drop the comment, and
> handle fd >= 0 case explicitly, please.
> 

My mistake — sorry for the misunderstanding.

You’re right; the return value should not be ignored. In the next
revision, I’ll handle the fd >= 0 case explicitly and drop the comment.
The logic will be updated along the lines of:

fd = syscall(__NR_bpf, BPF_PROG_LOAD | BPF_COMMON_ATTRS,
             &attr, attr_sz, NULL, sizeof(struct bpf_common_attr));
if (fd >= 0) {
        close(fd);
        return 0;
}
return errno == EFAULT;

Thanks,
Leon


