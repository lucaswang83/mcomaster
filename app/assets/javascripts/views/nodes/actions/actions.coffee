###
 Copyright 2013 ajf http://github.com/ajf8

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
###
MCM.Views.NodeActions = Backbone.Marionette.CompositeView.extend({
  template: HandlebarsTemplates['nodes/actions/view']
  
  #itemViewContainer: "#nodeAgentItemContainer"
  
  itemView: MCM.Views.AgentTableItem

  initialize: ->
    @listenTo @options.nodemodel, "change", @render
    
  itemViewOptions: ->
    return @options
    
  templateHelpers: ->
    ctx = _.extend(@options);
    if @options.nodemodel.attributes.checkin_age
      ctx.lastCheckinFormatted = moment.duration(0-@options.nodemodel.attributes.checkin_age, 'seconds').humanize(true)
    return ctx
});