From: sdf at fomichev.me (Stanislav Fomichev)
Date: Fri, 15 Mar 2019 13:56:52 -0700
Subject: [PATCH net-next] selftests: bpf: modify urandom_read and link it
 non-statically
In-Reply-To: <2dcdc11c-4d04-4b0e-ddb7-04d969d04651@redhat.com>
References: <20190315200414.32346-1-ivecera@redhat.com>
 <20190315200847.GC5481@mini-arch.hsd1.ca.comcast.net>
 <2dcdc11c-4d04-4b0e-ddb7-04d969d04651@redhat.com>
Message-ID: <20190315205652.GD5481@mini-arch.hsd1.ca.comcast.net>

On 03/15, Ivan Vecera wrote:
> On 15. 03. 19 21:08, Stanislav Fomichev wrote:
> > On 03/15, Ivan Vecera wrote:
> > > After some experiences I found that urandom_read does not need to be
> > > linked statically. When the 'read' syscall call is moved to separate
> > > non-inlined function then bpf_get_stackid() is able to find
> > > the executable in stack trace and extract its build_id from it.
> > But why? Do you have some problems with it being linked statically?
> > 
> Dependency... you don't need to install static glibc to compile the bpf
> samples. Shared libc is available everytime.
Oh, the distros that do -devel _and_ -static packages :-)

So your patch essentially adds a call, that leaves a trace on the stack
with our build-id. I guess that works as well.

> 
> Ivan
