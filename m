From: frowand.list@gmail.com (Frank Rowand)
Date: Thu, 2 May 2019 14:16:23 -0700
Subject: [PATCH v2 12/17] kunit: tool: add Python wrappers for running
 KUnit tests
In-Reply-To: <CAFd5g47t=EdLKFCT=CnPkrM2z0nDVo24Gz4j0VxFOJbARP37Lg@mail.gmail.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-13-brendanhiggins@google.com>
 <20190502110220.GD12416@kroah.com>
 <CAFd5g47t=EdLKFCT=CnPkrM2z0nDVo24Gz4j0VxFOJbARP37Lg@mail.gmail.com>
Message-ID: <a49c5088-a821-210c-66de-f422536f5b01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190502211623.9GDIIZFKx_Os7Y_Uafeht07q6VNve_6pqR7aP1kJ-YA@z>

On 5/2/19 11:07 AM, Brendan Higgins wrote:
> On Thu, May 2, 2019@4:02 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>>
>> On Wed, May 01, 2019@04:01:21PM -0700, Brendan Higgins wrote:
>>> From: Felix Guo <felixguoxiuping at gmail.com>
>>>
>>> The ultimate goal is to create minimal isolated test binaries; in the
>>> meantime we are using UML to provide the infrastructure to run tests, so
>>> define an abstract way to configure and run tests that allow us to
>>> change the context in which tests are built without affecting the user.
>>> This also makes pretty and dynamic error reporting, and a lot of other
>>> nice features easier.
>>>
>>> kunit_config.py:
>>>   - parse .config and Kconfig files.
>>>
>>> kunit_kernel.py: provides helper functions to:
>>>   - configure the kernel using kunitconfig.
>>>   - build the kernel with the appropriate configuration.
>>>   - provide function to invoke the kernel and stream the output back.
>>>
>>> Signed-off-by: Felix Guo <felixguoxiuping at gmail.com>
>>> Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
>>
>> Ah, here's probably my answer to my previous logging format question,
>> right?  What's the chance that these wrappers output stuff in a standard
>> format that test-framework-tools can already parse?  :)
> 
> It should be pretty easy to do. I had some patches that pack up the
> results into a serialized format for a presubmit service; it should be
> pretty straightforward to take the same logic and just change the
> output format.

When examining and trying out the previous versions of the patch I found
the wrappers useful to provide information about how to control and use
the tests, but I had no interest in using the scripts as they do not
fit in with my personal environment and workflow.

In the previous versions of the patch, these helper scripts are optional,
which is good for my use case.  If the helper scripts are required to
get the data into the proper format then the scripts are not quite so
optional, they become the expected environment.  I think the proper
format should exist without the helper scripts.

-Frank
