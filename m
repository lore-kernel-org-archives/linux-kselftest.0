From: dan.rue@linaro.org (Dan Rue)
Date: Mon, 23 Jul 2018 17:33:13 +0000
Subject: [PATCH] bpf: Add Python 3 support to selftests scripts for bpf
In-Reply-To: <dd971e43-3148-5a54-788e-d89835d3638a@redhat.com>
References: <20180718213610.19618-1-jcline@redhat.com>
 <1aa3dc98-2ab1-7386-d5d9-afd3dbb3fde9@iogearbox.net>
 <dd971e43-3148-5a54-788e-d89835d3638a@redhat.com>
Message-ID: <20180723173313.ri2uz7srtdtno2hl@linode.therub.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180723173313.nKk2JiJ80ZdXnq0qJaBXj-0F4aZ9A50VYjzp7u6vFtc@z>

On Mon, Jul 23, 2018@10:08:57AM -0400, Jeremy Cline wrote:
> Hi Daniel,
> 
> On 07/20/2018 04:45 PM, Daniel Borkmann wrote:
> > On 07/18/2018 11:36 PM, Jeremy Cline wrote:
> >> Adjust tcp_client.py and tcp_server.py to work with Python 3 by using
> >> the print function, marking string literals as bytes, and using the
> >> newer exception syntax. This should be functionally equivalent and
> >> support Python 2.6 through Python 3.7.
> >>
> >> Signed-off-by: Jeremy Cline <jcline at redhat.com>
> > 
> > Thanks for the patch, Jeremy! Given we also have test_offload.py in BPF
> > kselftests and it is written for python 3 only, it would probably make
> > sense to adapt the tcp_{client,server}.py towards python 3 as well, so
> > we wouldn't need to keep extra compat for 2 and have a consistent version
> > dependency. Lawrence / Jeremy, any objections?
> 
> I certainly don't object to Python 3 only and I'm happy to drop the
> Python 2 compatibility from this patch if that's okay.

This (well, along with introducing python in the first place, which took
me by surprise), sounds like a policy decision that should be made clear
in the kselftest documentation (Documentation/dev-tools/kselftest.rst).
Currently, that file does not mention any python requirement.

That said, I agree that python2 support is no longer necessary.

My use-case (which may be unusual?): We try to run all of kselftest
against a variety of kernels and architectures for every push to next,
mainline, and stable/lts branches. It seems that this is not a common
usecase, but shouldn't it be?

Dan

> 
> > 
> >>  tools/testing/selftests/bpf/tcp_client.py | 12 ++++++------
> >>  tools/testing/selftests/bpf/tcp_server.py | 17 +++++++++--------
> >>  2 files changed, 15 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/tools/testing/selftests/bpf/tcp_client.py b/tools/testing/selftests/bpf/tcp_client.py
> >> index 481dccdf140c..9fe5f1b5c020 100755
> >> --- a/tools/testing/selftests/bpf/tcp_client.py
> >> +++ b/tools/testing/selftests/bpf/tcp_client.py
> >> @@ -1,4 +1,4 @@
> >> -#!/usr/bin/env python2
> >> +#!/usr/bin/env python
> >>  #
> >>  # SPDX-License-Identifier: GPL-2.0
> >>  #
> >> @@ -9,11 +9,11 @@ import subprocess
> >>  import select
> >>  
> >>  def read(sock, n):
> >> -    buf = ''
> >> +    buf = b''
> >>      while len(buf) < n:
> >>          rem = n - len(buf)
> >>          try: s = sock.recv(rem)
> >> -        except (socket.error), e: return ''
> >> +        except (socket.error) as e: return b''
> >>          buf += s
> >>      return buf
> >>  
> >> @@ -22,7 +22,7 @@ def send(sock, s):
> >>      count = 0
> >>      while count < total:
> >>          try: n = sock.send(s)
> >> -        except (socket.error), e: n = 0
> >> +        except (socket.error) as e: n = 0
> >>          if n == 0:
> >>              return count;
> >>          count += n
> >> @@ -39,10 +39,10 @@ try:
> >>  except socket.error as e:
> >>      sys.exit(1)
> >>  
> >> -buf = ''
> >> +buf = b''
> >>  n = 0
> >>  while n < 1000:
> >> -    buf += '+'
> >> +    buf += b'+'
> >>      n += 1
> >>  
> >>  sock.settimeout(1);
> >> diff --git a/tools/testing/selftests/bpf/tcp_server.py b/tools/testing/selftests/bpf/tcp_server.py
> >> index bc454d7d0be2..1d4a40a6584b 100755
> >> --- a/tools/testing/selftests/bpf/tcp_server.py
> >> +++ b/tools/testing/selftests/bpf/tcp_server.py
> >> @@ -1,7 +1,8 @@
> >> -#!/usr/bin/env python2
> >> +#!/usr/bin/env python
> >>  #
> >>  # SPDX-License-Identifier: GPL-2.0
> >>  #
> >> +from __future__ import print_function
> >>  
> >>  import sys, os, os.path, getopt
> >>  import socket, time
> >> @@ -9,11 +10,11 @@ import subprocess
> >>  import select
> >>  
> >>  def read(sock, n):
> >> -    buf = ''
> >> +    buf = b''
> >>      while len(buf) < n:
> >>          rem = n - len(buf)
> >>          try: s = sock.recv(rem)
> >> -        except (socket.error), e: return ''
> >> +        except (socket.error) as e: return b''
> >>          buf += s
> >>      return buf
> >>  
> >> @@ -22,7 +23,7 @@ def send(sock, s):
> >>      count = 0
> >>      while count < total:
> >>          try: n = sock.send(s)
> >> -        except (socket.error), e: n = 0
> >> +        except (socket.error) as e: n = 0
> >>          if n == 0:
> >>              return count;
> >>          count += n
> >> @@ -43,7 +44,7 @@ host = socket.gethostname()
> >>  
> >>  try: serverSocket.bind((host, 0))
> >>  except socket.error as msg:
> >> -    print 'bind fails: ', msg
> >> +    print('bind fails: ' + str(msg))
> >>  
> >>  sn = serverSocket.getsockname()
> >>  serverPort = sn[1]
> >> @@ -51,10 +52,10 @@ serverPort = sn[1]
> >>  cmdStr = ("./tcp_client.py %d &") % (serverPort)
> >>  os.system(cmdStr)
> >>  
> >> -buf = ''
> >> +buf = b''
> >>  n = 0
> >>  while n < 500:
> >> -    buf += '.'
> >> +    buf += b'.'
> >>      n += 1
> >>  
> >>  serverSocket.listen(MAX_PORTS)
> >> @@ -79,5 +80,5 @@ while True:
> >>                  serverSocket.close()
> >>                  sys.exit(0)
> >>      else:
> >> -        print 'Select timeout!'
> >> +        print('Select timeout!')
> >>          sys.exit(1)
> >>
> > 
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
> the body of a message to majordomo at vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
