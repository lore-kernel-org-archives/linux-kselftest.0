Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795030850;
	b=tQx2d7WsxvSSBRAJ1uwJ1IsVmxQBARIfAEtJXbJlhfFTQeah5Yuf1Du5YFI60pvVWb7z
	 +16Ia5gApCDjIvhmCqjTSWX7qtS8iKnMMgobrrM2YO6zBY12R66N3DZVgWBekP8uH0Iv5
	 hdLolG0nW0vfykYV5Mv60/sxGpQrcMi4TAv8wxz9amPFc3orcYCok2L6I/Qnwil/Tsfql
	 /OD+wFLh4iuPGSYeAaGOAYdvBCgoYZ6PNXCWA9q7LlvulWCOPWKDcnRu4UYkCaFVYWpMb
	 8KHhwWYU3+uIjVUwEOT8kcZ7P714cYzE2leOVtI9PZ2DXPQliryGjH6JciAnPx94khQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795030850;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=cWWB+kno75GjXfJMFyZ2wCGHnXRHDXreldi/hia46/g=;
	b=V8+pnzCFSqe8HnX0x4zunPVZki8pno4ZSl4tf2WBhWWAsQhB4XF24LjuPZn9seIlfGCV
	 gbmbn2NEVbeFLCJaINRLo417YN2rKA8kdh6xmXcaQYWFsJzR5UGKTzTIUnRoECkYKJXKh
	 m5IZPCidXzPOr0P7tSqGo0sPFabxZ1WuiY/aDRHbzjBD9GUVtvdWytZ2WhxkfhIX2qcX7
	 e80qXV/8xRFMPLn1FE/W/3EVszUHYhe9ASlW6lLVs39/pYACEyGfRC/jwZvDowTeY+Tio
	 TfwfEpaPQnUvplzHlcQu+cPCmUB/K57qJuShWNw/bzP4DMunpr9qKxCQ/qZe9EHFBNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bsbernd.com;
	spf=pass smtp.mailfrom=bsbernd.com;
	dkim=pass header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=IuoiB3vz;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jLjoJhVC;
	arc=none smtp.remote-ip=103.168.172.150
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A55606D348
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 19:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A55606D348
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=IuoiB3vz;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jLjoJhVC
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id C6AE7EC05A3
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 14:40:48 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 18 Nov 2026 14:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795030848;
	 x=1795117248; bh=cWWB+kno75GjXfJMFyZ2wCGHnXRHDXreldi/hia46/g=; b=
	IuoiB3vzrwlymu75FBLr9TaZYOIZeJ3cfCwPZir4xDY5FWp7pbMdGwqH004UCodR
	22ieBNO7bfmkJ7oglxdDX5TgPLX86Xtdk3g0BB5GTVh1Hvzndt/asOIWUa472/Jl
	4KC981sxqGghYgiYxNgopsCiw8lpnMfLjUw8BcTlXvvu2TIl+d3I580wyISQdYgr
	PY9SJcIwNIbjxSHTjcUxGTZw7SiqH+fvTRCCiExEFWRPi0RTuz49xhIKym2V5nKH
	VBR8HYvnhWMjwzpwAvdW7myM6PJSJglZHkgpJqh8F6Ro3oqgLBTZRf+/adZw6NuI
	SbshiUIqGAPUJn4VEAK+Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795030848; x=
	1795117248; bh=cWWB+kno75GjXfJMFyZ2wCGHnXRHDXreldi/hia46/g=; b=j
	LjoJhVCrpW2LHOydyVwZU5fqO5jpIO62DRJBInlTzYrLNVbTDNjr4qt9MwKaoNGA
	5hjiQtXCEDn9+uxjED0l715NA4a2r7dXXl7M8wAQQuNjBTDAx4cRZj5AOevF1qhj
	wixRoMej59qnXA2tihHBEOsTyM+VQWD/f/TUKnQko9XlrSZuLOV4r8uX948TGexI
	g+Fo1qoymD23wS+FMYD/2o7QxEKzYw4u5Gw76KT53SMzvTXbF/zkz6vsI07ifYXn
	PS7xE4YEPgBHivw0Zklhfmz0sJzNVxOmhELNUR3FCaRqc/jbIhoZQ7sZmcCrpad8
	7S48+FaF/EMhfadXvWz4g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795030848; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:l6z5/W/dT0iv2Nw6KY1EnhO4nTL4UCmSCk5S4VesulTYOby
	+5mKV0XjlV2nVgZxogosWwTU/U1nqLnSk2GMzS6W2lHa2nqX/I7k932prCpxHyhp
	7Ay2KTwec+Qwt0YjxN2My3ZCSbFpjOLSTFjH5TcGIH9z0eMhFc+bSGOvt/vM27Rh
	1gGR7LNWpCoqgtuMrE++LL8MdKYwVQBV1+Y/8K8gk2y1ZzwShQOMJjppqlwT8JFx
	JcfZxsdwauQoBr2GLEtF3A4UDp47X0ugvT7qPsgDElcHl6jSAgyiSqfgVgaugTt5
	v6VPFKIRZUf6CoTJ97D9zkNDZmtKXiEniDkLjNw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:D3p1DLX3PbFpJz6EcwVkjic9keHvEuaBdt3Y/IcRqqQ=:wM50s4Sko8VHvk1R2Yz8yM7E6K5uBbzKhwHDk+qBbmI=;
X-ME-Sender: <xms:QP_9aiYsGS2eCj5I4dtefevAUi7LsPKEgAAtnrCQTO_vfVBI1W7zig>
    <xme:QP_9aofx3qgYubnVfAZd2OefoNWX1WirtW1APAJg7Okjp1FClYrJjFWufIzm24b7C
    BIZTrKemrhSB-AbIkoRzO-19g2eycadelHxHxEuoRdOABmhW7gA_w>
X-ME-Received: <xmr:QP_9ann4fUphn-xHlLQcT05GXs6sK12_pS4fXdENALXgj9rvq-x1M5YseOX63L_yVINtCesEYap4RrNxwfRzED__qKhvWUw3SYi7G7xVmbe_OP7SxQ>
X-ME-Proxy-Cause: dmFkZTGBzlEkt45nFNQKQ8X22V44dh/+XThQplDmZAYLv3KAXLmejJ35kqUz+X5LVgxNWR
    Yx6dnZSYgAgDxjWB3dtaIi8bNqbqlkmENb2RFRAeMq3BtjTjDOkaWGpw/E3/aRBDUFeR66
    zfX2e97fyLLFT6Xq2Xul2JQdIR+/ArJhVMuZFN6CNNFNcgtb2in8cXr36ZrAqFclAMShHj
    KmQ81+ISmzNsLuNQ03yMB+XJtJo12R2E/N0rbPRrqpR7+aBkf9+uLAOSazynqufH2P4piH
    xtNUfS401TYbtr85tFO+bFnli4XdyAKLDjkQC8MYHiyAunABn0DlR4f9mVkuSDdoJsJlQ9
    1askMdx9ozeqz3IUXXsb9Xu7MFzYpWBk95/SxizgcJ/rnCjS0+m7c9oF50Mbkj8/PrCncL
    n4JS2m/6cMYspXBGlStYjP+ZFhTRBsIVfEoHdJZ5fAQYSgY0UvpkSP9cFbG1rIhwBguiBv
    SD/1E5R2V3ZqSnZBVpw+rhltMgIzR8HHTcqdI+PVA2KQOcOsPY3H/9rixRlxyNNwWgmood
    lbGSEkR3Jgt7PCIiWPNpzQ71KpGAGTwXWVFaewp9WTOuDhY4ZPvC03avnBFWc8hCsBXpNs
    ZvhbquV57Ix9BB62vuO5fbV5U0jeD0K06Kyx/zSkxUTxxtWKjf8pF3ecWanA
X-ME-Proxy: <xmx:QP_9ag35bbtPrm8IOhEoolH9GZahbFdN6Q6FpFaCcPEZNR8teibwdA>
    <xmx:QP_9aochUQ3Rz8LJh3YGrrvETUuO48pLEGXbbUZuAVBZ5DSxZfgm9Q>
    <xmx:QP_9aiahkEyFJwcermJujLtwzFk9nkIOvelkfy-YXgWqHd_9iC8unw>
    <xmx:QP_9alGD35aUjMYK59b_KX8TZqzSBCRdmsH_xilkBNMiwaTxraaOjA>
    <xmx:QP_9ahp7RRpcD1TNMYSb2xXm2zALyxr_Yjy9pXUN0g6FrBaCsGVMhAaU>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Nov 2026 14:40:46 -0500 (EST)
Message-ID: <6c455765-a161-4a95-bca0-e82f8ae143ff@bsbernd.com>
Date: Wed, 18 Nov 2026 20:40:45 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] fuse: add FUSE_OPEN_ATOMIC
From: Bernd Schubert <bernd@bsbernd.com>
To: Jimmy Zuber <jamz@amazon.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Jim Harris <jiharris@nvidia.com>,
 Horst Birthelmer <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>,
 NeilBrown <neil@brown.name>, Joanne Koong <joannelkoong@gmail.com>
References: <20261110204421.1251726-1-jamz@amazon.com>
 <20261110204421.1251726-2-jamz@amazon.com>
 <fa582b7f-23ba-449d-b311-20f6ac8e867c@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <fa582b7f-23ba-449d-b311-20f6ac8e867c@bsbernd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/18/26 18:40, Bernd Schubert wrote:
> 
> 
> On 11/10/26 21:44, Jimmy Zuber wrote:
>> Add FUSE_OPEN_ATOMIC. FUSE_OPEN_ATOMIC is FUSE_LOOKUP plus FUSE_OPEN or
>> FUSE_CREATE in one request. With FUSE_OPEN_ATOMIC, the kernel opens a
>> name that is not in the dcache with one request to the server. This
>> greatly improves performance for file systems where the bottleneck is
>> calls between the kernel and the server. Servers that don't support
>> FUSE_OPEN_ATOMIC are handled gracefully.
>>
>> After a -ENOSYS reply to FUSE_OPEN_ATOMIC, every open() on the
>> connection uses FUSE_LOOKUP, FUSE_OPEN and FUSE_CREATE, including the
>> open() that received -ENOSYS.
>>
>> The kernel sends FUSE_OPEN_ATOMIC from ->atomic_open(). The VFS calls
>> ->atomic_open() for a name that is not in the dcache, and for open()
>> with O_CREAT on a negative dentry. For a name with a valid positive
>> dentry, the kernel sends FUSE_OPEN. FUSE_OPEN_ATOMIC for a name with a
>> valid positive dentry would need a VFS change.
>>
>> If the server opens an existing file, the VFS checks permissions after
>> the reply, as on other filesystems with ->atomic_open(). If open() fails
>> after a valid reply with fuse_open_out, the kernel sends FUSE_RELEASE.
>> With default_permissions, the server can receive FUSE_OPEN_ATOMIC and
>> FUSE_RELEASE for a file that the caller may not open.
>>
>> The kernel clears O_TRUNC in fuse_create_in.flags, so that the server
>> truncates a file only after the VFS checks permissions. After the VFS
>> checks permissions, the kernel sends FUSE_SETATTR to truncate an
>> existing file. A server with FUSE_ATOMIC_O_TRUNC truncates the file in
>> FUSE_OPEN. For open() with O_TRUNC on a server with FUSE_ATOMIC_O_TRUNC,
>> the kernel sends FUSE_OPEN or FUSE_CREATE after the VFS checks
>> permissions, with FUSE_LOOKUP first for a name that is not in the
>> dcache.
>>
>> The request contains fuse_create_in and the name. The reply contains
>> fuse_entry_out, and fuse_open_out if the server opened the file. The
>> server replies as follows:
>>
>> - O_CREAT | O_EXCL on an existing name: the server returns -EEXIST.
>> - An existing regular file, with or without O_CREAT: the server can
>>   open the file and return fuse_open_out. The server can also return
>>   only fuse_entry_out, and the kernel sends FUSE_OPEN after the VFS
>>   checks permissions.
>> - An existing directory, symlink or special file: the server must
>>   return only fuse_entry_out. The kernel returns -EIO for fuse_open_out
>>   on any file except a regular file.
>> - A missing name with O_CREAT: the server creates a regular file, opens
>>   it, and sets FOPEN_CREATED.
>> - A missing name without O_CREAT: the server returns a zero nodeid. The
>>   kernel caches a negative dentry, as it does for FUSE_LOOKUP.
>>
>> The server sets FOPEN_CREATED exactly when it created the file. For
>> FOPEN_CREATED, the kernel sets FMODE_CREATED, and do_open() passes an
>> acc_mode of 0 to may_open(), as for any file that open() creates.
>>
>> For O_CREAT | O_EXCL, when the caller may not create the file, for
>> example on a read-only mount, the VFS clears O_CREAT and leaves O_EXCL.
>> For O_EXCL without O_CREAT, the kernel sends FUSE_LOOKUP. For an
>> existing name, do_open() returns -EEXIST, and the server receives only
>> FUSE_LOOKUP.
>>
>> Signed-off-by: Jimmy Zuber <jamz@amazon.com>
>> ---
>>  fs/fuse/dir.c             | 194 ++++++++++++++++++++++++++++++++++++++
>>  fs/fuse/fuse_i.h          |   6 ++
>>  fs/fuse/fuse_trace.h      |   1 +
>>  include/uapi/linux/fuse.h |  20 +++-
>>  4 files changed, 220 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
>> index 8a8177a178a20..0331d4df6248e 100644
>> --- a/fs/fuse/dir.c
>> +++ b/fs/fuse/dir.c
>> @@ -938,6 +938,185 @@ static int fuse_create_open(const struct mnt_idmap *idmap, struct inode *dir,
>>  	return err;
>>  }
>>  
>> +/* Release the file the server opened for a reply the kernel rejects */
>> +static void fuse_open_atomic_release(struct fuse_file *ff, u64 nodeid,
>> +				     unsigned int open_size,
>> +				     unsigned int flags)
>> +{
>> +	if (open_size >= FUSE_COMPAT_OPEN_OUT_SIZE && !invalid_nodeid(nodeid)) {
>> +		ff->fh = ff->args->open_outarg.fh;
>> +		ff->nodeid = nodeid;
>> +		fuse_sync_release(NULL, ff, flags & ~(O_CREAT | O_EXCL));
>> +	} else {
>> +		fuse_file_free(ff);
>> +	}
>> +}
>> +
>> +/*
>> + * Send FUSE_LOOKUP plus FUSE_OPEN or FUSE_CREATE as one FUSE_OPEN_ATOMIC
>> + * request.  The server can open an existing regular file, or return only
>> + * fuse_entry_out.  Without O_CREAT, a missing name gets a zero nodeid.
>> + * The VFS checks permissions after the reply.  Returns 1 on -ENOSYS.
>> + */
>> +static int fuse_open_atomic(const struct mnt_idmap *idmap, struct inode *dir,
>> +			    struct dentry *entry, struct file *file,
>> +			    unsigned int flags, umode_t mode)
>> +{
>> +	struct fuse_mount *fm = get_fuse_mount(dir);
>> +	struct fuse_conn *fc = fm->fc;
>> +	FUSE_ARGS(args);
>> +	struct fuse_forget_link *forget;
>> +	struct fuse_create_in inarg;
> 
> Personally I'm not so happy about struct fuse_create_in. 
> 
> https://lore.kernel.org/all/20240813212149.1909627-1-joannelkoong@gmail.com/
> https://lore.kernel.org/all/20240820211735.2098951-1-bschubert@ddn.com/
> 
> 
> Summarized outcome from Miklos was that Miklos doesn't want to have another
> op code for this combined operation and that Miklos would prefer a NFS like
> compound way. Then Horst worked on compounds, with Miklos not wanting to
> have that in fuse, but only in fusex. Well, the underlying problem doesn't
> get solved - like there is a libfuse report with sshfs, where people set
> a high attr timeout and then get corruption, because the file size is plain
> wrong after open.
> 
> 
> My suggestion would be to have a new atomic_open struct, similar to
> fuse_create_in, but with flags. Given that atomic open is in the end
> just an open+getattr, we could also use that for the issue above, with the
> same new op code. However, we need Miklos' agreement here. 
> 

Btw, another reason for a different struct would be future flags to tell
the fuse server that the kernel now supports directories and other file
types. Sure, it could be done globally in FUSE_INIT, but we are running
out of these global flags and IMHO not so nice to have it global, when
it can be done local.
