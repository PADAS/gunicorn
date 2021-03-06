#
# Author:: Joshua Timberman <joshua@chef.io>
# Cookbook Name:: gunicorn
# Provider:: install
#
# Copyright:: Copyright (c) 2012-2015, Chef Software, Inc <legal@chef.io>
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

use_inline_resources

action :install do
  python_virtualenv new_resource.virtualenv do
    action :create
  end if new_resource.virtualenv

  python_package 'gunicorn' do
    virtualenv new_resource.virtualenv
    action :install
  end

  new_resource.updated_by_last_action(true)
end
